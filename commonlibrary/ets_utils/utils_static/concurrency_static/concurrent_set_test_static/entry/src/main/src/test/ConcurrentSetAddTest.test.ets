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

class MyClass {
  id: number
  constructor(id: number) {
    this.id = id
  }
}

async function addTaskNum(s: containers.ConcurrentSet<number>, v: number): Promise<void> {
  s.add(v)
}

async function addSameTask(s: containers.ConcurrentSet<number>): Promise<void> {
  s.add(1)
}

async function addSameValueTask(s: containers.ConcurrentSet<number>): Promise<void> {
  s.add(42)
}

async function outerTaskAddSize(): Promise<int> {
  let innerSet: containers.ConcurrentSet<int> = new containers.ConcurrentSet<int>()
  innerSet.add(1)
  innerSet.add(2)
  innerSet.add(3)
  return innerSet.size
}

async function outerTaskChainAddSize(): Promise<int> {
  let innerSet: containers.ConcurrentSet<int> = new containers.ConcurrentSet<int>()
  innerSet.add(1).add(2).add(3).add(4).add(5)
  return innerSet.size
}

async function outerTaskDuplicateAddSize(): Promise<int> {
  let innerSet: containers.ConcurrentSet<int> = new containers.ConcurrentSet<int>()
  innerSet.add(1)
  innerSet.add(1)
  innerSet.add(1)
  return innerSet.size
}

async function nestedAddTask(s: containers.ConcurrentSet<number>, v: number): Promise<void> {
  s.add(v)
}

async function addSameInCallback(s: containers.ConcurrentSet<number>): Promise<void> {
  s.add(100)
}

export default function ConcurrentSetAddTest(): void {
  describe('ConcurrentSetAddTest', (): void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll((): void => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (): Promise<void> => {

    })
    afterEach((): void => {
    })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100)
    })

    /**
     * @tc.name   ConcurrentSetAddTest0100
     * @tc.number SUB_CONCURRENTSET_ADD_TEST_0100
     * @tc.desc   Verify ConcurrentSet add() with number element adds successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetAddTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      expect(set.has(1)).assertTrue()
      expect(set.size).assertEqual(1)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetAddTest0200
     * @tc.number SUB_CONCURRENTSET_ADD_TEST_0200
     * @tc.desc   Verify ConcurrentSet add() chained call adds multiple elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetAddTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1).add(2).add(3)
      expect(set.size).assertEqual(3)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetAddTest0300
     * @tc.number SUB_CONCURRENTSET_ADD_TEST_0300
     * @tc.desc   Verify ConcurrentSet add() with large number element adds successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetAddTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(123)
      expect(set.has(123)).assertTrue()
      expect(set.size).assertEqual(1)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetAddTest0400
     * @tc.number SUB_CONCURRENTSET_ADD_TEST_0400
     * @tc.desc   Verify ConcurrentSet add() with string element adds successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetAddTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      set.add('abc')
      expect(set.has('abc')).assertTrue()
      expect(set.size).assertEqual(1)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetAddTest0500
     * @tc.number SUB_CONCURRENTSET_ADD_TEST_0500
     * @tc.desc   Verify ConcurrentSet add() with boolean element adds successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetAddTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<boolean> = new containers.ConcurrentSet<boolean>()
      set.add(true)
      expect(set.has(true)).assertTrue()
      expect(set.size).assertEqual(1)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetAddTest0600
     * @tc.number SUB_CONCURRENTSET_ADD_TEST_0600
     * @tc.desc   Verify ConcurrentSet add() with object element adds successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetAddTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<MyClass> = new containers.ConcurrentSet<MyClass>()
      let obj: MyClass = new MyClass(1)
      set.add(obj)
      expect(set.has(obj)).assertTrue()
      expect(set.size).assertEqual(1)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetAddTest0700
     * @tc.number SUB_CONCURRENTSET_ADD_TEST_0700
     * @tc.desc   Verify ConcurrentSet add() returns correct size and has result after adding element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetAddTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      expect(set.size).assertEqual(1)
      expect(set.has(1)).assertTrue()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetAddTest0800
     * @tc.number SUB_CONCURRENTSET_ADD_TEST_0800
     * @tc.desc   Verify ConcurrentSet add() with duplicate element does not increase size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetAddTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(1)
      set.add(1)
      expect(set.size).assertEqual(1)
      expect(set.has(1)).assertTrue()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetAddTest0900
     * @tc.number SUB_CONCURRENTSET_ADD_TEST_0900
     * @tc.desc   Verify ConcurrentSet add() with same value in loop does not increase size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetAddTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 10; i++) {
        set.add(100)
      }
      expect(set.size).assertEqual(1)
      expect(set.has(100)).assertTrue()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetAddTest1000
     * @tc.number SUB_CONCURRENTSET_ADD_TEST_1000
     * @tc.desc   Verify ConcurrentSet add() returns the ConcurrentSet instance itself for chaining
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetAddTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let result: containers.ConcurrentSet<number> = set.add(1)
      expect(result === set).assertTrue()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetAddTest1100
     * @tc.number SUB_CONCURRENTSET_ADD_TEST_1100
     * @tc.desc   Verify ConcurrentSet add() chained call with 5 elements all present
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetAddTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1).add(2).add(3).add(4).add(5)
      expect(set.size).assertEqual(5)
      expect(set.has(1)).assertTrue()
      expect(set.has(2)).assertTrue()
      expect(set.has(3)).assertTrue()
      expect(set.has(4)).assertTrue()
      expect(set.has(5)).assertTrue()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetAddTest1200
     * @tc.number SUB_CONCURRENTSET_ADD_TEST_1200
     * @tc.desc   Verify ConcurrentSet add() chained call with duplicates only keeps unique elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetAddTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1).add(1).add(1).add(2).add(2)
      expect(set.size).assertEqual(2)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetAddTest1300
     * @tc.number SUB_CONCURRENTSET_ADD_TEST_1300
     * @tc.desc   Verify ConcurrentSet add() chained call with 7 string elements size is correct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetAddTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      set.add('a').add('b').add('c').add('d').add('e').add('f').add('g')
      expect(set.size).assertEqual(7)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetAddTest1400
     * @tc.number SUB_CONCURRENTSET_ADD_TEST_1400
     * @tc.desc   Verify ConcurrentSet add() with 100 concurrent threads adding different elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetAddTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let promises: Promise<void>[] = []
      for (let i = 0; i < 100; i++) {
        promises.push(addTaskNum(set, i))
      }
      await Promise.all(promises)
      expect(set.size).assertEqual(100)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetAddTest1500
     * @tc.number SUB_CONCURRENTSET_ADD_TEST_1500
     * @tc.desc   Verify ConcurrentSet add() with 10 concurrent threads adding same element size is 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetAddTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let promises: Promise<void>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(addSameTask(set))
      }
      await Promise.all(promises)
      expect(set.size).assertEqual(1)
      expect(set.has(1)).assertTrue()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetAddTest1600
     * @tc.number SUB_CONCURRENTSET_ADD_TEST_1600
     * @tc.desc   Verify ConcurrentSet add() with 3 concurrent threads adding different elements size is 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetAddTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let promises: Promise<void>[] = []
      for (let i = 0; i < 3; i++) {
        promises.push(addTaskNum(set, i))
      }
      await Promise.all(promises)
      expect(set.size).assertEqual(3)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetAddTest1700
     * @tc.number SUB_CONCURRENTSET_ADD_TEST_1700
     * @tc.desc   Verify ConcurrentSet add() with 5 concurrent threads adding different elements size is 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetAddTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let promises: Promise<void>[] = []
      for (let i = 0; i < 5; i++) {
        promises.push(addTaskNum(set, i))
      }
      await Promise.all(promises)
      expect(set.size).assertEqual(5)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetAddTest1800
     * @tc.number SUB_CONCURRENTSET_ADD_TEST_1800
     * @tc.desc   Verify ConcurrentSet add() with 10 concurrent threads adding different elements size is 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetAddTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let promises: Promise<void>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(addTaskNum(set, i))
      }
      await Promise.all(promises)
      expect(set.size).assertEqual(10)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetAddTest1900
     * @tc.number SUB_CONCURRENTSET_ADD_TEST_1900
     * @tc.desc   Verify ConcurrentSet add() with 10 concurrent threads adding same value size is 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetAddTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let promises: Promise<void>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(addSameValueTask(set))
      }
      await Promise.all(promises)
      expect(set.size).assertEqual(1)
      expect(set.has(42)).assertTrue()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetAddTest2000
     * @tc.number SUB_CONCURRENTSET_ADD_TEST_2000
     * @tc.desc   Verify ConcurrentSet add() inside TaskPool task adds 3 elements size is 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetAddTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result: int = await outerTaskAddSize()
      expect(result).assertEqual(3)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetAddTest2100
     * @tc.number SUB_CONCURRENTSET_ADD_TEST_2100
     * @tc.desc   Verify ConcurrentSet add() chained call inside TaskPool task size is 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetAddTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result: int = await outerTaskChainAddSize()
      expect(result).assertEqual(5)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetAddTest2200
     * @tc.number SUB_CONCURRENTSET_ADD_TEST_2200
     * @tc.desc   Verify ConcurrentSet add() duplicate elements inside TaskPool task size is 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetAddTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result: int = await outerTaskDuplicateAddSize()
      expect(result).assertEqual(1)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetAddTest2300
     * @tc.number SUB_CONCURRENTSET_ADD_TEST_2300
     * @tc.desc   Verify ConcurrentSet add() inside onExecutionSucceeded callback adds elements correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetAddTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      expect(set.size).assertEqual(3)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetAddTest2400
     * @tc.number SUB_CONCURRENTSET_ADD_TEST_2400
     * @tc.desc   Verify ConcurrentSet add() inside onReceiveData callback with nested tasks adds 5 elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetAddTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let promises: Promise<void>[] = []
      for (let i = 0; i < 5; i++) {
        promises.push(nestedAddTask(set, i))
      }
      await Promise.all(promises)
      expect(set.size).assertEqual(5)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetAddTest2500
     * @tc.number SUB_CONCURRENTSET_ADD_TEST_2500
     * @tc.desc   Verify ConcurrentSet add() inside onReceiveData callback with same value size is 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetAddTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let promises: Promise<void>[] = []
      for (let i = 0; i < 5; i++) {
        promises.push(addSameInCallback(set))
      }
      await Promise.all(promises)
      expect(set.size).assertEqual(1)
      expect(set.has(100)).assertTrue()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetAddTest2600
     * @tc.number SUB_CONCURRENTSET_ADD_TEST_2600
     * @tc.desc   Verify ConcurrentSet add() with 100 concurrent threads high concurrency size is correct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetAddTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let promises: Promise<void>[] = []
      for (let i = 0; i < 100; i++) {
        promises.push(addTaskNum(set, i))
      }
      await Promise.all(promises)
      expect(set.size).assertEqual(100)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetAddTest2700
     * @tc.number SUB_CONCURRENTSET_ADD_TEST_2700
     * @tc.desc   Verify ConcurrentSet add() inside onExecutionSucceeded callback with AtomicInt wait
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetAddTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      expect(set.size).assertEqual(3)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetAddTest2800
     * @tc.number SUB_CONCURRENTSET_ADD_TEST_2800
     * @tc.desc   Verify ConcurrentSet add() inside onReceiveData callback with nested task pool adds 5 elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetAddTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let promises: Promise<void>[] = []
      for (let i = 0; i < 5; i++) {
        promises.push(nestedAddTask(set, i))
      }
      await Promise.all(promises)
      expect(set.size).assertEqual(5)
      Done()
    })
  })
}
