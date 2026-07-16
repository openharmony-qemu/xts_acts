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

class MyClass {
  id: number
  constructor(id: number) {
    this.id = id
  }
}


async function hasTaskNum(s: containers.ConcurrentSet<number>, v: number): Promise<boolean> {
  return s.has(v)
}


async function hasTaskStr(s: containers.ConcurrentSet<string>, v: string): Promise<boolean> {
  return s.has(v)
}


async function addTaskNum(s: containers.ConcurrentSet<number>, v: number): Promise<void> {
  s.add(v)
}


async function outerTaskHasExist(): Promise<boolean> {
  let innerSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
  innerSet.add(1)
  innerSet.add(2)
  innerSet.add(3)
  return innerSet.has(2)
}


async function outerTaskHasNotExist(): Promise<boolean> {
  let innerSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
  innerSet.add(1)
  innerSet.add(2)
  return innerSet.has(100)
}


async function hasTaskInCallback(s: containers.ConcurrentSet<number>, v: number): Promise<void> {
  if (s.has(v)) {
    let _: number = 1
  }
}

export default function ConcurrentSetHasTest(): void {
  describe('ConcurrentSetHasTest', (): void => {
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
     * @tc.name ConcurrentSetHasTest0100
     * @tc.number SUB_CONCURRENTSET_HAS_TEST_0100
     * @tc.desc   Test has() method returns true for existing number element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetHasTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      expect(set.has(1)).assertTrue()
      Done()
    })

    /**
     * @tc.name ConcurrentSetHasTest0200
     * @tc.number SUB_CONCURRENTSET_HAS_TEST_0200
     * @tc.desc   Test has() method returns false for non-existing number element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetHasTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      expect(set.has(999)).assertFalse()
      Done()
    })

    /**
     * @tc.name ConcurrentSetHasTest0300
     * @tc.number SUB_CONCURRENTSET_HAS_TEST_0300
     * @tc.desc   Test has() method returns false for all queries on empty set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetHasTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      expect(set.has(0)).assertFalse()
      expect(set.has(1)).assertFalse()
      expect(set.has(100)).assertFalse()
      Done()
    })

    /**
     * @tc.name ConcurrentSetHasTest0400
     * @tc.number SUB_CONCURRENTSET_HAS_TEST_0400
     * @tc.desc   Test has() method returns true for specific number value 123
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetHasTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(123)
      expect(set.has(123)).assertTrue()
      Done()
    })

    /**
     * @tc.name ConcurrentSetHasTest0500
     * @tc.number SUB_CONCURRENTSET_HAS_TEST_0500
     * @tc.desc   Test has() method with string type elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetHasTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      set.add('hello')
      expect(set.has('hello')).assertTrue()
      expect(set.has('world')).assertFalse()
      Done()
    })

    /**
     * @tc.name ConcurrentSetHasTest0600
     * @tc.number SUB_CONCURRENTSET_HAS_TEST_0600
     * @tc.desc   Test has() method with boolean type elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetHasTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<boolean> = new containers.ConcurrentSet<boolean>()
      set.add(true)
      expect(set.has(true)).assertTrue()
      expect(set.has(false)).assertFalse()
      Done()
    })

    /**
     * @tc.name ConcurrentSetHasTest0700
     * @tc.number SUB_CONCURRENTSET_HAS_TEST_0700
     * @tc.desc   Test has() method with custom class object element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetHasTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let obj: MyClass = new MyClass(1)
      let set: containers.ConcurrentSet<MyClass> = new containers.ConcurrentSet<MyClass>()
      set.add(obj)
      expect(set.has(obj)).assertTrue()
      Done()
    })

    /**
     * @tc.name ConcurrentSetHasTest0800
     * @tc.number SUB_CONCURRENTSET_HAS_TEST_0800
     * @tc.desc   Test has() method verifying existing single element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetHasTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      expect(set.has(1)).assertTrue()
      Done()
    })

    /**
     * @tc.name ConcurrentSetHasTest0900
     * @tc.number SUB_CONCURRENTSET_HAS_TEST_0900
     * @tc.desc   Test has() method verifying non-existing element returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetHasTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      expect(set.has(999)).assertFalse()
      Done()
    })

    /**
     * @tc.name ConcurrentSetHasTest1000
     * @tc.number SUB_CONCURRENTSET_HAS_TEST_1000
     * @tc.desc   Test has() method on empty set returns false for multiple queries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetHasTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      expect(set.has(0)).assertFalse()
      expect(set.has(1)).assertFalse()
      Done()
    })

    /**
     * @tc.name ConcurrentSetHasTest1100
     * @tc.number SUB_CONCURRENTSET_HAS_TEST_1100
     * @tc.desc   Test has() method with boundary number values (0, negative, large)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetHasTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(0)
      set.add(-1)
      set.add(1000000)
      expect(set.has(0)).assertTrue()
      expect(set.has(-1)).assertTrue()
      expect(set.has(1000000)).assertTrue()
      expect(set.has(1)).assertFalse()
      Done()
    })

    /**
     * @tc.name ConcurrentSetHasTest1200
     * @tc.number SUB_CONCURRENTSET_HAS_TEST_1200
     * @tc.desc   Test has() method returns true for single added element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetHasTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      expect(set.has(1)).assertTrue()
      Done()
    })

    /**
     * @tc.name ConcurrentSetHasTest1300
     * @tc.number SUB_CONCURRENTSET_HAS_TEST_1300
     * @tc.desc   Test has() method returns false for element not in set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetHasTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      expect(set.has(999)).assertFalse()
      Done()
    })

    /**
     * @tc.name ConcurrentSetHasTest1400
     * @tc.number SUB_CONCURRENTSET_HAS_TEST_1400
     * @tc.desc   Test has() method on empty set for single query
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetHasTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      expect(set.has(0)).assertFalse()
      Done()
    })

    /**
     * @tc.name ConcurrentSetHasTest1500
     * @tc.number SUB_CONCURRENTSET_HAS_TEST_1500
     * @tc.desc   Test has() method on set with 10 sequential number elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetHasTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 10; i++) {
        set.add(i)
      }
      for (let i = 0; i < 10; i++) {
        expect(set.has(i)).assertTrue()
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetHasTest1600
     * @tc.number SUB_CONCURRENTSET_HAS_TEST_1600
     * @tc.desc   Test has() method with string type verifying existence and non-existence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetHasTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      set.add('hello')
      expect(set.has('hello')).assertTrue()
      expect(set.has('world')).assertFalse()
      Done()
    })

    /**
     * @tc.name ConcurrentSetHasTest1700
     * @tc.number SUB_CONCURRENTSET_HAS_TEST_1700
     * @tc.desc   Test has() method with boolean type verifying existence and non-existence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetHasTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<boolean> = new containers.ConcurrentSet<boolean>()
      set.add(true)
      expect(set.has(true)).assertTrue()
      expect(set.has(false)).assertFalse()
      Done()
    })

    /**
     * @tc.name ConcurrentSetHasTest1800
     * @tc.number SUB_CONCURRENTSET_HAS_TEST_1800
     * @tc.desc   Test has() method with boundary values verification without non-existing check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetHasTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(0)
      set.add(-1)
      set.add(1000000)
      expect(set.has(0)).assertTrue()
      expect(set.has(-1)).assertTrue()
      expect(set.has(1000000)).assertTrue()
      Done()
    })

    /**
     * @tc.name ConcurrentSetHasTest1900
     * @tc.number SUB_CONCURRENTSET_HAS_TEST_1900
     * @tc.desc   Test has() method concurrently with 10 async tasks for existing elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHasTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 10; i++) {
        set.add(i)
      }
      let promises: Promise<boolean>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(hasTaskNum(set, i))
      }
      let results: boolean[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertTrue()
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetHasTest2000
     * @tc.number SUB_CONCURRENTSET_HAS_TEST_2000
     * @tc.desc   Test has() method concurrently with 10 async tasks for non-existing elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHasTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 10; i++) {
        set.add(i)
      }
      let promises: Promise<boolean>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(hasTaskNum(set, i + 100.0))
      }
      let results: boolean[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertFalse()
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetHasTest2100
     * @tc.number SUB_CONCURRENTSET_HAS_TEST_2100
     * @tc.desc   Test has() method concurrently with 3 specific async tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHasTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(10)
      set.add(20)
      set.add(30)
      let results: boolean[] = await Promise.all([
        hasTaskNum(set, 10.0),
        hasTaskNum(set, 20.0),
        hasTaskNum(set, 30.0)
      ])
      expect(results.length).assertEqual(3)
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertTrue()
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetHasTest2200
     * @tc.number SUB_CONCURRENTSET_HAS_TEST_2200
     * @tc.desc   Test has() method concurrently on string type set with 5 async tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHasTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      set.add('a')
      set.add('b')
      set.add('c')
      set.add('d')
      set.add('e')
      let promises: Promise<boolean>[] = []
      let values: string[] = ['a', 'b', 'c', 'd', 'e']
      for (let i = 0; i < 5; i++) {
        promises.push(hasTaskStr(set, values[i]))
      }
      let results: boolean[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertTrue()
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetHasTest2300
     * @tc.number SUB_CONCURRENTSET_HAS_TEST_2300
     * @tc.desc   Test has() method concurrently with 10 tasks verifying all existing elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHasTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 10; i++) {
        set.add(i)
      }
      let promises: Promise<boolean>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(hasTaskNum(set, i))
      }
      let results: boolean[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertTrue()
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetHasTest2400
     * @tc.number SUB_CONCURRENTSET_HAS_TEST_2400
     * @tc.desc   Test has() method after concurrent add operations via async
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHasTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let addPromises: Promise<void>[] = []
      for (let i = 0; i < 5; i++) {
        addPromises.push(addTaskNum(set, i))
      }
      await Promise.all(addPromises)
      let hasPromises: Promise<boolean>[] = []
      for (let i = 0; i < 5; i++) {
        hasPromises.push(hasTaskNum(set, i))
      }
      let results: boolean[] = await Promise.all(hasPromises)
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertTrue()
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetHasTest2500
     * @tc.number SUB_CONCURRENTSET_HAS_TEST_2500
     * @tc.desc   Test has() method in outer async task with existing element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHasTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result: boolean = await outerTaskHasExist()
      expect(result).assertTrue()
      Done()
    })

    /**
     * @tc.name ConcurrentSetHasTest2600
     * @tc.number SUB_CONCURRENTSET_HAS_TEST_2600
     * @tc.desc   Test has() method in outer async task with non-existing element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHasTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result: boolean = await outerTaskHasNotExist()
      expect(result).assertFalse()
      Done()
    })

    /**
     * @tc.name ConcurrentSetHasTest2700
     * @tc.number SUB_CONCURRENTSET_HAS_TEST_2700
     * @tc.desc   Test has() method in nested task via onExecutionSucceeded callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHasTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let promises: Promise<void>[] = []
      for (let i = 1; i <= 3; i++) {
        promises.push(hasTaskInCallback(set, i))
      }
      await Promise.all(promises)
      expect(set.has(1)).assertTrue()
      expect(set.has(2)).assertTrue()
      expect(set.has(3)).assertTrue()
      Done()
    })

    /**
     * @tc.name ConcurrentSetHasTest2800
     * @tc.number SUB_CONCURRENTSET_HAS_TEST_2800
     * @tc.desc   Test has() method in nested task via onReceiveData callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHasTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(10)
      set.add(20)
      set.add(30)
      let promises: Promise<boolean>[] = []
      let vals: number[] = [10, 20, 30]
      for (let j = 0; j < vals.length; j++) {
        promises.push(hasTaskNum(set, vals[j]))
      }
      let results: boolean[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertTrue()
      }
      Done()
    })
  })
}
