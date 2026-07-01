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

class MyClass {
  id: number
  constructor(id: number) {
    this.id = id
  }
}


async function createEmptySetTaskNum(): Promise<containers.ConcurrentSet<number>> {
  return new containers.ConcurrentSet<number>()
}


async function createEmptySetTaskStr(): Promise<containers.ConcurrentSet<string>> {
  return new containers.ConcurrentSet<string>()
}


async function outerTaskReturnSet(): Promise<containers.ConcurrentSet<number>> {
  let innerSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
  return innerSet
}


async function outerTaskAddAndReturnSize(): Promise<int> {
  let innerSet: containers.ConcurrentSet<int> = new containers.ConcurrentSet<int>()
  innerSet.add(1)
  innerSet.add(2)
  return innerSet.size
}

export default function ConcurrentSetConstructorEmptyTest(): void {
  describe('ConcurrentSetConstructorEmptyTest', (): void => {
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
     * @tc.name   ConcurrentSetConstructorEmptyTest0100
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_EMPTY_TEST_0100
     * @tc.desc   Verify ConcurrentSet constructor() with no arguments creates empty instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetConstructorEmptyTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      expect(set.size).assertEqual(0)
      expect(set.has(1)).assertFalse()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorEmptyTest0200
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_EMPTY_TEST_0200
     * @tc.desc   Verify ConcurrentSet constructor() default generic creates empty instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetConstructorEmptyTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      expect(set.size).assertEqual(0)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorEmptyTest0300
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_EMPTY_TEST_0300
     * @tc.desc   Verify ConcurrentSet constructor() with number generic type creates empty set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetConstructorEmptyTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      expect(set.size).assertEqual(0)
      expect(set.has(0)).assertFalse()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorEmptyTest0400
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_EMPTY_TEST_0400
     * @tc.desc   Verify ConcurrentSet constructor() with string generic type creates empty set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetConstructorEmptyTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      expect(set.size).assertEqual(0)
      expect(set.has('test')).assertFalse()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorEmptyTest0500
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_EMPTY_TEST_0500
     * @tc.desc   Verify ConcurrentSet constructor() with object generic type creates empty set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetConstructorEmptyTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<MyClass> = new containers.ConcurrentSet<MyClass>()
      expect(set.size).assertEqual(0)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorEmptyTest0600
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_EMPTY_TEST_0600
     * @tc.desc   Verify ConcurrentSet constructor() returns valid ConcurrentSet instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetConstructorEmptyTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      expect(set.size).assertEqual(0)
      expect(set.has(1)).assertFalse()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorEmptyTest0700
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_EMPTY_TEST_0700
     * @tc.desc   Verify ConcurrentSet constructor() creates instance with size property equal to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetConstructorEmptyTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      expect(set.size).assertEqual(0)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorEmptyTest0800
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_EMPTY_TEST_0800
     * @tc.desc   Verify ConcurrentSet constructor() empty set has() returns false for any value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetConstructorEmptyTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      expect(set.has(0)).assertFalse()
      expect(set.has(100)).assertFalse()
      expect(set.has(-1)).assertFalse()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorEmptyTest0900
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_EMPTY_TEST_0900
     * @tc.desc   Verify ConcurrentSet constructor() single thread empty creation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetConstructorEmptyTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      expect(set.size).assertEqual(0)
      expect(set.has(1)).assertFalse()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorEmptyTest1000
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_EMPTY_TEST_1000
     * @tc.desc   Verify ConcurrentSet constructor() single thread size verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetConstructorEmptyTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      expect(set.size).assertEqual(0)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorEmptyTest1100
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_EMPTY_TEST_1100
     * @tc.desc   Verify ConcurrentSet constructor() single thread has verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetConstructorEmptyTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      expect(set.has(0)).assertFalse()
      expect(set.has(100)).assertFalse()
      expect(set.has(-1)).assertFalse()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorEmptyTest1200
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_EMPTY_TEST_1200
     * @tc.desc   Verify ConcurrentSet constructor() with 10 concurrent threads creates empty instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetConstructorEmptyTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let promises: Promise<containers.ConcurrentSet<number>>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(createEmptySetTaskNum())
      }
      let results: containers.ConcurrentSet<number>[] = await Promise.all(promises)
      expect(results.length).assertEqual(10)
      for (let i = 0; i < results.length; i++) {
        expect(results[i].size).assertEqual(0)
      }
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorEmptyTest1300
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_EMPTY_TEST_1300
     * @tc.desc   Verify ConcurrentSet constructor() with 3 concurrent threads creates empty instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetConstructorEmptyTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let results: containers.ConcurrentSet<number>[] = await Promise.all([
        createEmptySetTaskNum(),
        createEmptySetTaskNum(),
        createEmptySetTaskNum()
      ])
      expect(results.length).assertEqual(3)
      for (let i = 0; i < results.length; i++) {
        expect(results[i].size).assertEqual(0)
      }
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorEmptyTest1400
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_EMPTY_TEST_1400
     * @tc.desc   Verify ConcurrentSet constructor() with 5 concurrent threads creates empty instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetConstructorEmptyTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let promises: Promise<containers.ConcurrentSet<string>>[] = []
      for (let i = 0; i < 5; i++) {
        promises.push(createEmptySetTaskStr())
      }
      let results: containers.ConcurrentSet<string>[] = await Promise.all(promises)
      expect(results.length).assertEqual(5)
      for (let i = 0; i < results.length; i++) {
        expect(results[i].size).assertEqual(0)
      }
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorEmptyTest1500
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_EMPTY_TEST_1500
     * @tc.desc   Verify ConcurrentSet constructor() with 10 small concurrent threads creates empty instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetConstructorEmptyTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let promises: Promise<containers.ConcurrentSet<number>>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(createEmptySetTaskNum())
      }
      let results: containers.ConcurrentSet<number>[] = await Promise.all(promises)
      expect(results.length).assertEqual(10)
      for (let i = 0; i < results.length; i++) {
        expect(results[i].size).assertEqual(0)
      }
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorEmptyTest1600
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_EMPTY_TEST_1600
     * @tc.desc   Verify ConcurrentSet constructor() inside TaskPool task creates empty set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetConstructorEmptyTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result: containers.ConcurrentSet<number> = await outerTaskReturnSet()
      expect(result.size).assertEqual(0)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorEmptyTest1700
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_EMPTY_TEST_1700
     * @tc.desc   Verify ConcurrentSet constructor() inside TaskPool task with add operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetConstructorEmptyTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result: int = await outerTaskAddAndReturnSize()
      expect(result).assertEqual(2)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorEmptyTest1800
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_EMPTY_TEST_1800
     * @tc.desc   Verify ConcurrentSet constructor() inside onExecutionSucceeded callback with counter wait
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetConstructorEmptyTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let completed: AtomicInt = new AtomicInt(0)
      await Promise.all([
        (async (): Promise<void> => {
          let innerSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
          completed.fetchAdd(1)
        })()
      ])
      expect(completed.load()).assertEqual(1)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorEmptyTest1900
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_EMPTY_TEST_1900
     * @tc.desc   Verify ConcurrentSet constructor() inside onReceiveData callback with Promise.all wait
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetConstructorEmptyTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let nestedPromises: Promise<containers.ConcurrentSet<number>>[] = []
      await Promise.all([
        (async (): Promise<void> => {
          nestedPromises.push(createEmptySetTaskNum())
        })()
      ])
      await Promise.all(nestedPromises)
      expect(nestedPromises.length).assertEqual(1)
      Done()
    })
  })
}
