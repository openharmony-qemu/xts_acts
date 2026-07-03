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


async function createSetFromReadonlySetNum(sourceSet: Set<number>): Promise<containers.ConcurrentSet<number>> {
  return new containers.ConcurrentSet<number>(sourceSet)
}


async function createSetFromReadonlySetStr(sourceSet: Set<string>): Promise<containers.ConcurrentSet<string>> {
  return new containers.ConcurrentSet<string>(sourceSet)
}


async function outerTaskReadonlySetSize(): Promise<int> {
  let sourceSet: Set<int> = new Set<int>()
  for (let i = 0; i < 5; i++) {
    sourceSet.add(i)
  }
  let innerSet: containers.ConcurrentSet<int> = new containers.ConcurrentSet<int>(sourceSet)
  return innerSet.size
}


async function outerTaskReadonlySetHas(): Promise<boolean> {
  let sourceSet: Set<number> = new Set<number>()
  sourceSet.add(100)
  sourceSet.add(200)
  sourceSet.add(300)
  let innerSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(sourceSet)
  return innerSet.has(100) && innerSet.has(200) && innerSet.has(300)
}

export default function ConcurrentSetConstructorReadonlySetTest(): void {
  describe('ConcurrentSetConstructorReadonlySetTest', (): void => {
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
     * @tc.name   ConcurrentSetConstructorReadonlySetTest0100
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_READONLYSET_TEST_0100
     * @tc.desc   Verify ConcurrentSet constructor with Set of 10 numbers creates set with all elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetConstructorReadonlySetTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let setSource: Set<number> = new Set<number>()
      for (let i = 0; i < 10; i++) {
        setSource.add(i)
      }
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(setSource)
      expect(set.size).assertEqual(10)
      for (let i = 0; i < 10; i++) {
        expect(set.has(i)).assertTrue()
      }
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorReadonlySetTest0200
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_READONLYSET_TEST_0200
     * @tc.desc   Verify ConcurrentSet constructor with empty Set creates empty set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetConstructorReadonlySetTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let setSource: Set<number> = new Set<number>()
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(setSource)
      expect(set.size).assertEqual(0)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorReadonlySetTest0300
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_READONLYSET_TEST_0300
     * @tc.desc   Verify ConcurrentSet constructor with 10-element Set size is 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetConstructorReadonlySetTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let setSource: Set<number> = new Set<number>()
      for (let i = 0; i < 10; i++) {
        setSource.add(i)
      }
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(setSource)
      expect(set.size).assertEqual(10)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorReadonlySetTest0400
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_READONLYSET_TEST_0400
     * @tc.desc   Verify ConcurrentSet constructor with string Set creates set with all elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetConstructorReadonlySetTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let setSource: Set<string> = new Set<string>()
      setSource.add('apple')
      setSource.add('banana')
      setSource.add('orange')
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>(setSource)
      expect(set.size).assertEqual(3)
      expect(set.has('apple')).assertTrue()
      expect(set.has('banana')).assertTrue()
      expect(set.has('orange')).assertTrue()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorReadonlySetTest0500
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_READONLYSET_TEST_0500
     * @tc.desc   Verify ConcurrentSet constructor with empty Set size is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetConstructorReadonlySetTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let setSource: Set<number> = new Set<number>()
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(setSource)
      expect(set.size).assertEqual(0)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorReadonlySetTest0600
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_READONLYSET_TEST_0600
     * @tc.desc   Verify ConcurrentSet constructor with 100-element Set size is 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetConstructorReadonlySetTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let setSource: Set<number> = new Set<number>()
      for (let i = 0; i < 100; i++) {
        setSource.add(i)
      }
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(setSource)
      expect(set.size).assertEqual(100)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorReadonlySetTest0700
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_READONLYSET_TEST_0700
     * @tc.desc   Verify ConcurrentSet constructor with Set returns valid ConcurrentSet instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetConstructorReadonlySetTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let setSource: Set<number> = new Set<number>()
      for (let i = 0; i < 10; i++) {
        setSource.add(i)
      }
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(setSource)
      expect(set.size).assertEqual(10)
      expect(set.has(0)).assertTrue()
      expect(set.has(9)).assertTrue()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorReadonlySetTest0800
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_READONLYSET_TEST_0800
     * @tc.desc   Verify ConcurrentSet constructor with Set has returns true for all elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetConstructorReadonlySetTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let setSource: Set<number> = new Set<number>()
      for (let i = 0; i < 10; i++) {
        setSource.add(i)
      }
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(setSource)
      expect(set.size).assertEqual(10)
      for (let i = 0; i < 10; i++) {
        expect(set.has(i)).assertTrue()
      }
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorReadonlySetTest0900
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_READONLYSET_TEST_0900
     * @tc.desc   Verify ConcurrentSet constructor with 10-element Set size is 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetConstructorReadonlySetTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let setSource: Set<number> = new Set<number>()
      for (let i = 0; i < 10; i++) {
        setSource.add(i)
      }
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(setSource)
      expect(set.size).assertEqual(10)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorReadonlySetTest1000
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_READONLYSET_TEST_1000
     * @tc.desc   Verify ConcurrentSet constructor with string Set size is 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetConstructorReadonlySetTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let setSource: Set<string> = new Set<string>()
      setSource.add('apple')
      setSource.add('banana')
      setSource.add('orange')
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>(setSource)
      expect(set.size).assertEqual(3)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorReadonlySetTest1100
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_READONLYSET_TEST_1100
     * @tc.desc   Verify ConcurrentSet constructor with empty Set single thread size is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetConstructorReadonlySetTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let setSource: Set<number> = new Set<number>()
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(setSource)
      expect(set.size).assertEqual(0)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorReadonlySetTest1200
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_READONLYSET_TEST_1200
     * @tc.desc   Verify ConcurrentSet constructor with 100-element Set single thread size is 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetConstructorReadonlySetTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let setSource: Set<number> = new Set<number>()
      for (let i = 0; i < 100; i++) {
        setSource.add(i)
      }
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(setSource)
      expect(set.size).assertEqual(100)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorReadonlySetTest1300
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_READONLYSET_TEST_1300
     * @tc.desc   Verify ConcurrentSet constructor with 10 concurrent Set tasks creates correct sets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetConstructorReadonlySetTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let setSource: Set<number> = new Set<number>()
      for (let i = 0; i < 10; i++) {
        setSource.add(i)
      }
      let promises: Promise<containers.ConcurrentSet<number>>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(createSetFromReadonlySetNum(setSource))
      }
      let results: containers.ConcurrentSet<number>[] = await Promise.all(promises)
      expect(results.length).assertEqual(10)
      for (let i = 0; i < results.length; i++) {
        expect(results[i].size).assertEqual(10)
      }
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorReadonlySetTest1400
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_READONLYSET_TEST_1400
     * @tc.desc   Verify ConcurrentSet constructor with 3 concurrent Set tasks creates correct sets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetConstructorReadonlySetTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let setSource: Set<number> = new Set<number>()
      setSource.add(10)
      setSource.add(20)
      setSource.add(30)
      let results: containers.ConcurrentSet<number>[] = await Promise.all([
        createSetFromReadonlySetNum(setSource),
        createSetFromReadonlySetNum(setSource),
        createSetFromReadonlySetNum(setSource)
      ])
      expect(results.length).assertEqual(3)
      for (let i = 0; i < results.length; i++) {
        expect(results[i].size).assertEqual(3)
      }
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorReadonlySetTest1500
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_READONLYSET_TEST_1500
     * @tc.desc   Verify ConcurrentSet constructor with 5 concurrent string Set tasks creates correct sets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetConstructorReadonlySetTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let setSource: Set<string> = new Set<string>()
      setSource.add('a')
      setSource.add('b')
      setSource.add('c')
      setSource.add('d')
      setSource.add('e')
      let promises: Promise<containers.ConcurrentSet<string>>[] = []
      for (let i = 0; i < 5; i++) {
        promises.push(createSetFromReadonlySetStr(setSource))
      }
      let results: containers.ConcurrentSet<string>[] = await Promise.all(promises)
      expect(results.length).assertEqual(5)
      for (let i = 0; i < results.length; i++) {
        expect(results[i].size).assertEqual(5)
      }
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorReadonlySetTest1600
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_READONLYSET_TEST_1600
     * @tc.desc   Verify ConcurrentSet constructor with 10 concurrent 10-element Set tasks creates correct sets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetConstructorReadonlySetTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let setSource: Set<number> = new Set<number>()
      for (let i = 0; i < 10; i++) {
        setSource.add(i)
      }
      let promises: Promise<containers.ConcurrentSet<number>>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(createSetFromReadonlySetNum(setSource))
      }
      let results: containers.ConcurrentSet<number>[] = await Promise.all(promises)
      expect(results.length).assertEqual(10)
      for (let i = 0; i < results.length; i++) {
        expect(results[i].size).assertEqual(10)
      }
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorReadonlySetTest1700
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_READONLYSET_TEST_1700
     * @tc.desc   Verify ConcurrentSet constructor inside TaskPool task with Set size is correct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetConstructorReadonlySetTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result: int = await outerTaskReadonlySetSize()
      expect(result).assertEqual(5)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorReadonlySetTest1800
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_READONLYSET_TEST_1800
     * @tc.desc   Verify ConcurrentSet constructor inside TaskPool task with Set has returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetConstructorReadonlySetTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result: boolean = await outerTaskReadonlySetHas()
      expect(result).assertTrue()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorReadonlySetTest1900
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_READONLYSET_TEST_1900
     * @tc.desc   Verify ConcurrentSet constructor inside onExecutionSucceeded callback with Set creates set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetConstructorReadonlySetTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let completed: AtomicInt = new AtomicInt(0)
      await Promise.all([
        (async (): Promise<void> => {
          let sourceSet: Set<number> = new Set<number>()
          sourceSet.add(1)
          sourceSet.add(2)
          sourceSet.add(3)
          let innerSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(sourceSet)
          completed.fetchAdd(1)
        })()
      ])
      expect(completed.load()).assertEqual(1)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorReadonlySetTest2000
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_READONLYSET_TEST_2000
     * @tc.desc   Verify ConcurrentSet constructor inside onReceiveData callback with nested Set task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetConstructorReadonlySetTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let nestedPromises: Promise<containers.ConcurrentSet<number>>[] = []
      await Promise.all([
        (async (): Promise<void> => {
          let sourceSet: Set<number> = new Set<number>()
          sourceSet.add(1)
          sourceSet.add(2)
          sourceSet.add(3)
          nestedPromises.push(createSetFromReadonlySetNum(sourceSet))
        })()
      ])
      await Promise.all(nestedPromises)
      expect(nestedPromises.length).assertEqual(1)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorReadonlySetTest2100
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_READONLYSET_TEST_2100
     * @tc.desc   Verify ConcurrentSet constructor with 10 concurrent Set nested tasks creates correct sets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetConstructorReadonlySetTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let setSource: Set<number> = new Set<number>()
      for (let i = 0; i < 10; i++) {
        setSource.add(i)
      }
      let promises: Promise<containers.ConcurrentSet<number>>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(createSetFromReadonlySetNum(setSource))
      }
      let results: containers.ConcurrentSet<number>[] = await Promise.all(promises)
      expect(results.length).assertEqual(10)
      for (let i = 0; i < results.length; i++) {
        expect(results[i].size).assertEqual(10)
      }
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorReadonlySetTest2200
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_READONLYSET_TEST_2200
     * @tc.desc   Verify ConcurrentSet constructor inside onExecutionSucceeded callback with Set creates set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetConstructorReadonlySetTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let completed: AtomicInt = new AtomicInt(0)
      await Promise.all([
        (async (): Promise<void> => {
          let sourceSet: Set<number> = new Set<number>()
          sourceSet.add(1)
          sourceSet.add(2)
          sourceSet.add(3)
          let innerSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(sourceSet)
          completed.fetchAdd(1)
        })()
      ])
      expect(completed.load()).assertEqual(1)
      Done()
    })
  })
}
