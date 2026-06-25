'use static'
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


async function createSetFromIterableNum(iter: Iterable<number>): Promise<containers.ConcurrentSet<number>> {
  return new containers.ConcurrentSet<number>(iter)
}


async function createSetFromIterableStr(iter: Iterable<string>): Promise<containers.ConcurrentSet<string>> {
  return new containers.ConcurrentSet<string>(iter)
}


async function outerTaskIterableSize(): Promise<int> {
  let setSource: Set<int> = new Set<int>()
  for (let i = 0; i < 5; i++) {
    setSource.add(i)
  }
  let iter: IterableIterator<int> = setSource.keys()
  let innerSet: containers.ConcurrentSet<int> = new containers.ConcurrentSet<int>(iter)
  return innerSet.size
}


async function outerTaskIterableHas(): Promise<boolean> {
  let setSource: Set<number> = new Set<number>()
  setSource.add(10)
  setSource.add(20)
  setSource.add(30)
  let iter: IterableIterator<number> = setSource.keys()
  let innerSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(iter)
  return innerSet.has(10) && innerSet.has(20) && innerSet.has(30)
}

export default function ConcurrentSetConstructorIterableTest(): void {
  describe('ConcurrentSetConstructorIterableTest', (): void => {
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
     * @tc.name   ConcurrentSetConstructorIterableTest0100
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_ITERABLE_TEST_0100
     * @tc.desc   Verify ConcurrentSet constructor with IterableIterator from Set.keys() creates set with all elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetConstructorIterableTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let setSource: Set<number> = new Set<number>()
      for (let i = 0; i < 10; i++) {
        setSource.add(i)
      }
      let iter: IterableIterator<number> = setSource.keys()
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(iter)
      expect(set.size).assertEqual(10)
      for (let i = 0; i < 10; i++) {
        expect(set.has(i)).assertTrue()
      }
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorIterableTest0200
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_ITERABLE_TEST_0200
     * @tc.desc   Verify ConcurrentSet constructor with empty Set IterableIterator creates empty set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetConstructorIterableTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let setSource: Set<number> = new Set<number>()
      let iter: IterableIterator<number> = setSource.keys()
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(iter)
      expect(set.size).assertEqual(0)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorIterableTest0300
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_ITERABLE_TEST_0300
     * @tc.desc   Verify ConcurrentSet constructor with 10-element Set IterableIterator size is 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetConstructorIterableTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let setSource: Set<number> = new Set<number>()
      for (let i = 0; i < 10; i++) {
        setSource.add(i)
      }
      let iter: IterableIterator<number> = setSource.keys()
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(iter)
      expect(set.size).assertEqual(10)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorIterableTest0400
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_ITERABLE_TEST_0400
     * @tc.desc   Verify ConcurrentSet constructor with string Set.values() iterator creates set with all elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetConstructorIterableTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let setSource: Set<string> = new Set<string>()
      setSource.add('a')
      setSource.add('b')
      setSource.add('c')
      let iter: IterableIterator<string> = setSource.values()
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>(iter)
      expect(set.size).assertEqual(3)
      expect(set.has('a')).assertTrue()
      expect(set.has('b')).assertTrue()
      expect(set.has('c')).assertTrue()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorIterableTest0500
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_ITERABLE_TEST_0500
     * @tc.desc   Verify ConcurrentSet constructor with empty Set IterableIterator size is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetConstructorIterableTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let setSource: Set<number> = new Set<number>()
      let iter: IterableIterator<number> = setSource.keys()
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(iter)
      expect(set.size).assertEqual(0)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorIterableTest0600
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_ITERABLE_TEST_0600
     * @tc.desc   Verify ConcurrentSet constructor with 100-element Set IterableIterator size is 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetConstructorIterableTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let setSource: Set<number> = new Set<number>()
      for (let i = 0; i < 100; i++) {
        setSource.add(i)
      }
      let iter: IterableIterator<number> = setSource.keys()
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(iter)
      expect(set.size).assertEqual(100)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorIterableTest0700
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_ITERABLE_TEST_0700
     * @tc.desc   Verify ConcurrentSet constructor with IterableIterator returns valid ConcurrentSet instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetConstructorIterableTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let setSource: Set<number> = new Set<number>()
      for (let i = 0; i < 10; i++) {
        setSource.add(i)
      }
      let iter: IterableIterator<number> = setSource.keys()
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(iter)
      expect(set.size).assertEqual(10)
      expect(set.has(0)).assertTrue()
      expect(set.has(9)).assertTrue()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorIterableTest0800
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_ITERABLE_TEST_0800
     * @tc.desc   Verify ConcurrentSet constructor with IterableIterator has returns true for all elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetConstructorIterableTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let setSource: Set<number> = new Set<number>()
      for (let i = 0; i < 10; i++) {
        setSource.add(i)
      }
      let iter: IterableIterator<number> = setSource.keys()
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(iter)
      expect(set.size).assertEqual(10)
      for (let i = 0; i < 10; i++) {
        expect(set.has(i)).assertTrue()
      }
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorIterableTest0900
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_ITERABLE_TEST_0900
     * @tc.desc   Verify ConcurrentSet constructor with 10-element Set IterableIterator size is 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetConstructorIterableTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let setSource: Set<number> = new Set<number>()
      for (let i = 0; i < 10; i++) {
        setSource.add(i)
      }
      let iter: IterableIterator<number> = setSource.keys()
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(iter)
      expect(set.size).assertEqual(10)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorIterableTest1000
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_ITERABLE_TEST_1000
     * @tc.desc   Verify ConcurrentSet constructor with string Set.values() iterator size is 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetConstructorIterableTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let setSource: Set<string> = new Set<string>()
      setSource.add('a')
      setSource.add('b')
      setSource.add('c')
      let iter: IterableIterator<string> = setSource.values()
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>(iter)
      expect(set.size).assertEqual(3)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorIterableTest1100
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_ITERABLE_TEST_1100
     * @tc.desc   Verify ConcurrentSet constructor with empty Set IterableIterator single thread size is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetConstructorIterableTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let setSource: Set<number> = new Set<number>()
      let iter: IterableIterator<number> = setSource.keys()
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(iter)
      expect(set.size).assertEqual(0)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorIterableTest1200
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_ITERABLE_TEST_1200
     * @tc.desc   Verify ConcurrentSet constructor with 100-element Set IterableIterator single thread size is 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetConstructorIterableTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let setSource: Set<number> = new Set<number>()
      for (let i = 0; i < 100; i++) {
        setSource.add(i)
      }
      let iter: IterableIterator<number> = setSource.keys()
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(iter)
      expect(set.size).assertEqual(100)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorIterableTest1300
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_ITERABLE_TEST_1300
     * @tc.desc   Verify ConcurrentSet constructor with 10 concurrent IterableIterator tasks creates correct sets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetConstructorIterableTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let setSource: Set<number> = new Set<number>()
      for (let i = 0; i < 10; i++) {
        setSource.add(i)
      }
      let promises: Promise<containers.ConcurrentSet<number>>[] = []
      for (let i = 0; i < 10; i++) {
        let iter: IterableIterator<number> = setSource.keys()
        promises.push(createSetFromIterableNum(iter))
      }
      let results: containers.ConcurrentSet<number>[] = await Promise.all(promises)
      expect(results.length).assertEqual(10)
      for (let i = 0; i < results.length; i++) {
        expect(results[i].size).assertEqual(10)
      }
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorIterableTest1400
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_ITERABLE_TEST_1400
     * @tc.desc   Verify ConcurrentSet constructor with 3 concurrent IterableIterator tasks creates correct sets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetConstructorIterableTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let setSource: Set<number> = new Set<number>()
      for (let i = 0; i < 3; i++) {
        setSource.add(i)
      }
      let results: containers.ConcurrentSet<number>[] = await Promise.all([
        createSetFromIterableNum(setSource.keys()),
        createSetFromIterableNum(setSource.keys()),
        createSetFromIterableNum(setSource.keys())
      ])
      expect(results.length).assertEqual(3)
      for (let i = 0; i < results.length; i++) {
        expect(results[i].size).assertEqual(3)
      }
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorIterableTest1500
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_ITERABLE_TEST_1500
     * @tc.desc   Verify ConcurrentSet constructor with 5 concurrent string IterableIterator tasks creates correct sets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetConstructorIterableTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let setSource: Set<string> = new Set<string>()
      setSource.add('a')
      setSource.add('b')
      setSource.add('c')
      setSource.add('d')
      setSource.add('e')
      let promises: Promise<containers.ConcurrentSet<string>>[] = []
      for (let i = 0; i < 5; i++) {
        let iter: IterableIterator<string> = setSource.keys()
        promises.push(createSetFromIterableStr(iter))
      }
      let results: containers.ConcurrentSet<string>[] = await Promise.all(promises)
      expect(results.length).assertEqual(5)
      for (let i = 0; i < results.length; i++) {
        expect(results[i].size).assertEqual(5)
      }
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorIterableTest1600
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_ITERABLE_TEST_1600
     * @tc.desc   Verify ConcurrentSet constructor with 10 concurrent 10-element IterableIterator tasks creates correct sets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetConstructorIterableTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let setSource: Set<number> = new Set<number>()
      for (let i = 0; i < 10; i++) {
        setSource.add(i)
      }
      let promises: Promise<containers.ConcurrentSet<number>>[] = []
      for (let i = 0; i < 10; i++) {
        let iter: IterableIterator<number> = setSource.keys()
        promises.push(createSetFromIterableNum(iter))
      }
      let results: containers.ConcurrentSet<number>[] = await Promise.all(promises)
      expect(results.length).assertEqual(10)
      for (let i = 0; i < results.length; i++) {
        expect(results[i].size).assertEqual(10)
      }
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorIterableTest1700
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_ITERABLE_TEST_1700
     * @tc.desc   Verify ConcurrentSet constructor inside TaskPool task with IterableIterator size is correct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetConstructorIterableTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result: int = await outerTaskIterableSize()
      expect(result).assertEqual(5)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorIterableTest1800
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_ITERABLE_TEST_1800
     * @tc.desc   Verify ConcurrentSet constructor inside TaskPool task with IterableIterator has returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetConstructorIterableTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result: boolean = await outerTaskIterableHas()
      expect(result).assertTrue()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorIterableTest1900
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_ITERABLE_TEST_1900
     * @tc.desc   Verify ConcurrentSet constructor inside onExecutionSucceeded callback with IterableIterator creates set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetConstructorIterableTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let completed: AtomicInt = new AtomicInt(0)
      await Promise.all([
        (async (): Promise<void> => {
          let setSource: Set<number> = new Set<number>()
          setSource.add(1)
          setSource.add(2)
          setSource.add(3)
          let iter: IterableIterator<number> = setSource.keys()
          let innerSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(iter)
          completed.fetchAdd(1)
        })()
      ])
      expect(completed.load()).assertEqual(1)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorIterableTest2000
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_ITERABLE_TEST_2000
     * @tc.desc   Verify ConcurrentSet constructor inside onReceiveData callback with nested IterableIterator task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetConstructorIterableTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let nestedPromises: Promise<containers.ConcurrentSet<number>>[] = []
      await Promise.all([
        (async (): Promise<void> => {
          let setSource: Set<number> = new Set<number>()
          setSource.add(1)
          setSource.add(2)
          setSource.add(3)
          let iter: IterableIterator<number> = setSource.keys()
          nestedPromises.push(createSetFromIterableNum(iter))
        })()
      ])
      await Promise.all(nestedPromises)
      expect(nestedPromises.length).assertEqual(1)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorIterableTest2100
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_ITERABLE_TEST_2100
     * @tc.desc   Verify ConcurrentSet constructor with 10 concurrent IterableIterator nested tasks creates correct sets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetConstructorIterableTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let setSource: Set<number> = new Set<number>()
      for (let i = 0; i < 10; i++) {
        setSource.add(i)
      }
      let promises: Promise<containers.ConcurrentSet<number>>[] = []
      for (let i = 0; i < 10; i++) {
        let iter: IterableIterator<number> = setSource.keys()
        promises.push(createSetFromIterableNum(iter))
      }
      let results: containers.ConcurrentSet<number>[] = await Promise.all(promises)
      expect(results.length).assertEqual(10)
      for (let i = 0; i < results.length; i++) {
        expect(results[i].size).assertEqual(10)
      }
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorIterableTest2200
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_ITERABLE_TEST_2200
     * @tc.desc   Verify ConcurrentSet constructor inside onExecutionSucceeded callback with IterableIterator creates set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetConstructorIterableTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let completed: AtomicInt = new AtomicInt(0)
      await Promise.all([
        (async (): Promise<void> => {
          let setSource: Set<number> = new Set<number>()
          setSource.add(1)
          setSource.add(2)
          setSource.add(3)
          let iter: IterableIterator<number> = setSource.keys()
          let innerSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(iter)
          completed.fetchAdd(1)
        })()
      ])
      expect(completed.load()).assertEqual(1)
      Done()
    })
  })
}
