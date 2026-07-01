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


async function valuesTaskNum(s: containers.ConcurrentSet<number>): Promise<number> {
  let iter: IterableIterator<number> = s.values()
  let count: number = 0
  let item: IteratorResult<number> = iter.next()
  while (!item.done) {
    count++
    item = iter.next()
  }
  return count
}


async function valuesTaskStr(s: containers.ConcurrentSet<string>): Promise<number> {
  let iter: IterableIterator<string> = s.values()
  let count: number = 0
  let item: IteratorResult<string> = iter.next()
  while (!item.done) {
    count++
    item = iter.next()
  }
  return count
}


async function outerTaskValuesCount(): Promise<number> {
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


async function outerTaskValuesEmpty(): Promise<number> {
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


async function valuesTaskInCallback(s: containers.ConcurrentSet<number>): Promise<number> {
  let iter: IterableIterator<number> = s.values()
  let count: number = 0
  let item: IteratorResult<number> = iter.next()
  while (!item.done) {
    count++
    item = iter.next()
  }
  return count
}



export default function ConcurrentSetValuesTest(): void {
  describe('ConcurrentSetValuesTest', (): void => {
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
     * @tc.name ConcurrentSetValuesTest0100
     * @tc.number SUB_CONCURRENTSET_VALUES_TEST_0100
     * @tc.desc   Test values() iterator on number set with 3 elements and verify value range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetValuesTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
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
     * @tc.name ConcurrentSetValuesTest0200
     * @tc.number SUB_CONCURRENTSET_VALUES_TEST_0200
     * @tc.desc   Test values() iterator on empty set returns done immediately
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetValuesTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let iter: IterableIterator<number> = set.values()
      let item: IteratorResult<number> = iter.next()
      expect(item.done).assertTrue()
      Done()
    })

    /**
     * @tc.name ConcurrentSetValuesTest0300
     * @tc.number SUB_CONCURRENTSET_VALUES_TEST_0300
     * @tc.desc   Test values() iterator traversal count equals 3 on number set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetValuesTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
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
     * @tc.name ConcurrentSetValuesTest0400
     * @tc.number SUB_CONCURRENTSET_VALUES_TEST_0400
     * @tc.desc   Test values() iterator on string type set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetValuesTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
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
     * @tc.name ConcurrentSetValuesTest0500
     * @tc.number SUB_CONCURRENTSET_VALUES_TEST_0500
     * @tc.desc   Test values() iterator on empty set returns done=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetValuesTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let iter: IterableIterator<number> = set.values()
      let item: IteratorResult<number> = iter.next()
      expect(item.done).assertTrue()
      Done()
    })

    /**
     * @tc.name ConcurrentSetValuesTest0600
     * @tc.number SUB_CONCURRENTSET_VALUES_TEST_0600
     * @tc.desc   Test values() iterator on set with 100 elements verifying count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetValuesTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
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
     * @tc.name ConcurrentSetValuesTest0700
     * @tc.number SUB_CONCURRENTSET_VALUES_TEST_0700
     * @tc.desc   Test values() iterator first next() returns valid element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetValuesTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
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
     * @tc.name ConcurrentSetValuesTest0800
     * @tc.number SUB_CONCURRENTSET_VALUES_TEST_0800
     * @tc.desc   Test values() iterator traversal count equals 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetValuesTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
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
     * @tc.name ConcurrentSetValuesTest0900
     * @tc.number SUB_CONCURRENTSET_VALUES_TEST_0900
     * @tc.desc   Test values() iterator on 3-element number set verifying count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetValuesTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
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
     * @tc.name ConcurrentSetValuesTest1000
     * @tc.number SUB_CONCURRENTSET_VALUES_TEST_1000
     * @tc.desc   Test values() iterator on string type set verifying count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetValuesTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
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
     * @tc.name ConcurrentSetValuesTest1100
     * @tc.number SUB_CONCURRENTSET_VALUES_TEST_1100
     * @tc.desc   Test values() iterator on empty set verifying done=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetValuesTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let iter: IterableIterator<number> = set.values()
      let item: IteratorResult<number> = iter.next()
      expect(item.done).assertTrue()
      Done()
    })

    /**
     * @tc.name ConcurrentSetValuesTest1200
     * @tc.number SUB_CONCURRENTSET_VALUES_TEST_1200
     * @tc.desc   Test values() iterator on set with 100 elements verifying count equals 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetValuesTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
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
     * @tc.name ConcurrentSetValuesTest1300
     * @tc.number SUB_CONCURRENTSET_VALUES_TEST_1300
     * @tc.desc   Test two independent values() iterators on the same set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetValuesTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
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
     * @tc.name ConcurrentSetValuesTest1400
     * @tc.number SUB_CONCURRENTSET_VALUES_TEST_1400
     * @tc.desc   Test values() iterator next() returns done=true after traversal ends
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetValuesTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
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
     * @tc.name ConcurrentSetValuesTest1500
     * @tc.number SUB_CONCURRENTSET_VALUES_TEST_1500
     * @tc.desc   Test values() iterator values are all present in set via has()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetValuesTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
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
     * @tc.name ConcurrentSetValuesTest1600
     * @tc.number SUB_CONCURRENTSET_VALUES_TEST_1600
     * @tc.desc   Test values() iterator count equals set.size property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetValuesTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
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
     * @tc.name ConcurrentSetValuesTest1700
     * @tc.number SUB_CONCURRENTSET_VALUES_TEST_1700
     * @tc.desc   Test values() iterator on string type set verifying traversal count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetValuesTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
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
     * @tc.name ConcurrentSetValuesTest1800
     * @tc.number SUB_CONCURRENTSET_VALUES_TEST_1800
     * @tc.desc   Test values() iterator on empty set verifying done=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetValuesTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let iter: IterableIterator<number> = set.values()
      let item: IteratorResult<number> = iter.next()
      expect(item.done).assertTrue()
      Done()
    })

    /**
     * @tc.name ConcurrentSetValuesTest1900
     * @tc.number SUB_CONCURRENTSET_VALUES_TEST_1900
     * @tc.desc   Test values() iterator on set with 100 elements verifying count equals 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetValuesTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
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
     * @tc.name ConcurrentSetValuesTest2000
     * @tc.number SUB_CONCURRENTSET_VALUES_TEST_2000
     * @tc.desc   Test values() iterator first next() returns not-done result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetValuesTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
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
     * @tc.name ConcurrentSetValuesTest2100
     * @tc.number SUB_CONCURRENTSET_VALUES_TEST_2100
     * @tc.desc   Test values() iterator on 3-element number set verifying traversal count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetValuesTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
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
     * @tc.name ConcurrentSetValuesTest2200
     * @tc.number SUB_CONCURRENTSET_VALUES_TEST_2200
     * @tc.desc   Test values() iterator on 3-element number set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetValuesTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
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
     * @tc.name ConcurrentSetValuesTest2300
     * @tc.number SUB_CONCURRENTSET_VALUES_TEST_2300
     * @tc.desc   Test values() iterator on string type set verifying count equals 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetValuesTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
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
     * @tc.name ConcurrentSetValuesTest2400
     * @tc.number SUB_CONCURRENTSET_VALUES_TEST_2400
     * @tc.desc   Test values() iterator on empty set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetValuesTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let iter: IterableIterator<number> = set.values()
      let item: IteratorResult<number> = iter.next()
      expect(item.done).assertTrue()
      Done()
    })

    /**
     * @tc.name ConcurrentSetValuesTest2500
     * @tc.number SUB_CONCURRENTSET_VALUES_TEST_2500
     * @tc.desc   Test values() iterator on set with 100 elements verifying count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetValuesTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
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
     * @tc.name ConcurrentSetValuesTest2600
     * @tc.number SUB_CONCURRENTSET_VALUES_TEST_2600
     * @tc.desc   Test two independent values() iterators on the same set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetValuesTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
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
     * @tc.name ConcurrentSetValuesTest2700
     * @tc.number SUB_CONCURRENTSET_VALUES_TEST_2700
     * @tc.desc   Test values() iterator returns done=true after full traversal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetValuesTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
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
     * @tc.name ConcurrentSetValuesTest2800
     * @tc.number SUB_CONCURRENTSET_VALUES_TEST_2800
     * @tc.desc   Test values() iterator values all exist in set via has()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetValuesTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
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
     * @tc.name ConcurrentSetValuesTest2900
     * @tc.number SUB_CONCURRENTSET_VALUES_TEST_2900
     * @tc.desc   Test values() iterator count equals set.size property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetValuesTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
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
     * @tc.name ConcurrentSetValuesTest3000
     * @tc.number SUB_CONCURRENTSET_VALUES_TEST_3000
     * @tc.desc   Test values() iterator after adding element during iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetValuesTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
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
     * @tc.name ConcurrentSetValuesTest3100
     * @tc.number SUB_CONCURRENTSET_VALUES_TEST_3100
     * @tc.desc   Test values() iterator after deleting element during iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetValuesTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
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
     * @tc.name ConcurrentSetValuesTest3200
     * @tc.number SUB_CONCURRENTSET_VALUES_TEST_3200
     * @tc.desc   Test values() iterator concurrently with 10 async tasks on number set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetValuesTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 10; i++) {
        set.add(i)
      }
      let promises: Promise<number>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(valuesTaskNum(set))
      }
      let results: number[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(10)
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetValuesTest3300
     * @tc.number SUB_CONCURRENTSET_VALUES_TEST_3300
     * @tc.desc   Test values() iterator concurrently on empty set via async
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetValuesTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let promises: Promise<number>[] = []
      for (let i = 0; i < 5; i++) {
        promises.push(valuesTaskNum(set))
      }
      let results: number[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(0)
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetValuesTest3400
     * @tc.number SUB_CONCURRENTSET_VALUES_TEST_3400
     * @tc.desc   Test values() iterator concurrently with 3 specific async tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetValuesTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(10)
      set.add(20)
      set.add(30)
      let results: number[] = await Promise.all([
        valuesTaskNum(set),
        valuesTaskNum(set),
        valuesTaskNum(set)
      ])
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(3)
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetValuesTest3500
     * @tc.number SUB_CONCURRENTSET_VALUES_TEST_3500
     * @tc.desc   Test values() iterator concurrently on string type set with 5 async tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetValuesTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      set.add('a')
      set.add('b')
      set.add('c')
      set.add('d')
      set.add('e')
      let promises: Promise<number>[] = []
      for (let i = 0; i < 5; i++) {
        promises.push(valuesTaskStr(set))
      }
      let results: number[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(5)
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetValuesTest3600
     * @tc.number SUB_CONCURRENTSET_VALUES_TEST_3600
     * @tc.desc   Test values() iterator concurrently with 10 tasks on 10-element set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetValuesTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 10; i++) {
        set.add(i)
      }
      let promises: Promise<number>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(valuesTaskNum(set))
      }
      let results: number[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(10)
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetValuesTest3700
     * @tc.number SUB_CONCURRENTSET_VALUES_TEST_3700
     * @tc.desc   Test values() iterator in outer async task with 3 elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetValuesTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result: number = await outerTaskValuesCount()
      expect(result).assertEqual(3)
      Done()
    })

    /**
     * @tc.name ConcurrentSetValuesTest3800
     * @tc.number SUB_CONCURRENTSET_VALUES_TEST_3800
     * @tc.desc   Test values() iterator in outer async task on empty set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetValuesTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result: number = await outerTaskValuesEmpty()
      expect(result).assertEqual(0)
      Done()
    })

    /**
     * @tc.name ConcurrentSetValuesTest3900
     * @tc.number SUB_CONCURRENTSET_VALUES_TEST_3900
     * @tc.desc   Test values() iterator in nested task via onExecutionSucceeded callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetValuesTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let results: number[] = await Promise.all([valuesTaskInCallback(set)])
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(3)
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetValuesTest4000
     * @tc.number SUB_CONCURRENTSET_VALUES_TEST_4000
     * @tc.desc   Test values() iterator in nested task via onReceiveData callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetValuesTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let results: number[] = await Promise.all([valuesTaskInCallback(set)])
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(3)
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetValuesTest4100
     * @tc.number SUB_CONCURRENTSET_VALUES_TEST_4100
     * @tc.desc   Test values() iterator concurrently with 10 tasks verifying count equals 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetValuesTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 10; i++) {
        set.add(i)
      }
      let promises: Promise<number>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(valuesTaskNum(set))
      }
      let results: number[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(10)
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetValuesTest4200
     * @tc.number SUB_CONCURRENTSET_VALUES_TEST_4200
     * @tc.desc   Test values() iterator in nested task via onExecutionSucceeded callback with 3-element set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetValuesTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let results: number[] = await Promise.all([valuesTaskInCallback(set)])
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(3)
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetValuesTest4300
     * @tc.number SUB_CONCURRENTSET_VALUES_TEST_4300
     * @tc.desc   Test values() iterator on 3-element number set verifying traversal count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetValuesTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
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
     * @tc.name ConcurrentSetValuesTest4400
     * @tc.number SUB_CONCURRENTSET_VALUES_TEST_4400
     * @tc.desc   Test values() iterator on empty set verifying done=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetValuesTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let iter: IterableIterator<number> = set.values()
      let item: IteratorResult<number> = iter.next()
      expect(item.done).assertTrue()
      Done()
    })

    /**
     * @tc.name ConcurrentSetValuesTest4500
     * @tc.number SUB_CONCURRENTSET_VALUES_TEST_4500
     * @tc.desc   Test values() iterator on string type set with xyz elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetValuesTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
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
     * @tc.name ConcurrentSetValuesTest4600
     * @tc.number SUB_CONCURRENTSET_VALUES_TEST_4600
     * @tc.desc   Test values() iterator on single-element set verifying value and done
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetValuesTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
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
     * @tc.name ConcurrentSetValuesTest4700
     * @tc.number SUB_CONCURRENTSET_VALUES_TEST_4700
     * @tc.desc   Test two values() iterators on 2-element set verifying both start correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetValuesTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
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
     * @tc.name ConcurrentSetValuesTest4800
     * @tc.number SUB_CONCURRENTSET_VALUES_TEST_4800
     * @tc.desc   Test values() iterator returns done=true after full traversal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetValuesTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
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
     * @tc.name ConcurrentSetValuesTest4900
     * @tc.number SUB_CONCURRENTSET_VALUES_TEST_4900
     * @tc.desc   Test values() iterator values all exist in set via has()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetValuesTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
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
     * @tc.name ConcurrentSetValuesTest5000
     * @tc.number SUB_CONCURRENTSET_VALUES_TEST_5000
     * @tc.desc   Test values() iterator count equals set.size property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetValuesTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
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
     * @tc.name ConcurrentSetValuesTest5100
     * @tc.number SUB_CONCURRENTSET_VALUES_TEST_5100
     * @tc.desc   Test values() iterator after adding element during iteration verifying count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetValuesTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
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
     * @tc.name ConcurrentSetValuesTest5200
     * @tc.number SUB_CONCURRENTSET_VALUES_TEST_5200
     * @tc.desc   Test values() iterator after deleting element during iteration verifying count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetValuesTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
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
     * @tc.name ConcurrentSetValuesTest5300
     * @tc.number SUB_CONCURRENTSET_VALUES_TEST_5300
     * @tc.desc   Test keys() and values() iterators consistency on same set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetValuesTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let keysIter: IterableIterator<number> = set.keys()
      let valsIter: IterableIterator<number> = set.values()
      let keysCount: number = 0
      let valsCount: number = 0
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
      expect(keysCount).assertEqual(valsCount)
      Done()
    })

    /**
     * @tc.name ConcurrentSetValuesTest5400
     * @tc.number SUB_CONCURRENTSET_VALUES_TEST_5400
     * @tc.desc   Test values() iterator concurrently with 10 async tasks on 10-element set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetValuesTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 10; i++) {
        set.add(i)
      }
      let promises: Promise<number>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(valuesTaskNum(set))
      }
      let results: number[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(10)
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetValuesTest5500
     * @tc.number SUB_CONCURRENTSET_VALUES_TEST_5500
     * @tc.desc   Test values() iterator in nested task via onReceiveData callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetValuesTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let results: number[] = await Promise.all([valuesTaskInCallback(set)])
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(3)
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetValuesTest5600
     * @tc.number SUB_CONCURRENTSET_VALUES_TEST_5600
     * @tc.desc   Test values() iterator on 3-element number set verifying traversal count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetValuesTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
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
     * @tc.name ConcurrentSetValuesTest5700
     * @tc.number SUB_CONCURRENTSET_VALUES_TEST_5700
     * @tc.desc   Test values() iterator on empty set verifying done=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetValuesTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let iter: IterableIterator<number> = set.values()
      let item: IteratorResult<number> = iter.next()
      expect(item.done).assertTrue()
      Done()
    })

    /**
     * @tc.name ConcurrentSetValuesTest5800
     * @tc.number SUB_CONCURRENTSET_VALUES_TEST_5800
     * @tc.desc   Test values() iterator values all exist in set via has() verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetValuesTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
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
     * @tc.name ConcurrentSetValuesTest5900
     * @tc.number SUB_CONCURRENTSET_VALUES_TEST_5900
     * @tc.desc   Test values() iterator in nested task via onExecutionSucceeded callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetValuesTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let results: number[] = await Promise.all([valuesTaskInCallback(set)])
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(3)
      }
      Done()
    })
  })
}
