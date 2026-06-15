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


async function deleteTaskNum(s: containers.ConcurrentSet<number>, v: number): Promise<boolean> {
  return s.delete(v)
}


async function deleteTaskStr(s: containers.ConcurrentSet<string>, v: string): Promise<boolean> {
  return s.delete(v)
}


async function deleteSameTask(s: containers.ConcurrentSet<number>): Promise<boolean> {
  return s.delete(42)
}


async function outerTaskDeleteExist(): Promise<boolean> {
  let innerSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
  innerSet.add(1)
  innerSet.add(2)
  innerSet.add(3)
  return innerSet.delete(2)
}


async function outerTaskDeleteNotExist(): Promise<boolean> {
  let innerSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
  innerSet.add(1)
  return innerSet.delete(100)
}


async function outerTaskDeleteSize(): Promise<int> {
  let innerSet: containers.ConcurrentSet<int> = new containers.ConcurrentSet<int>()
  innerSet.add(1)
  innerSet.add(2)
  innerSet.add(3)
  innerSet.delete(1)
  innerSet.delete(2)
  return innerSet.size
}


async function deleteTaskInCallback(s: containers.ConcurrentSet<number>, v: number): Promise<void> {
  s.delete(v)
}

export default function ConcurrentSetDeleteTest(): void {
  describe('ConcurrentSetDeleteTest', (): void => {
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
     * @tc.name   ConcurrentSetDeleteTest0100
     * @tc.number SUB_CONCURRENTSET_DELETE_TEST_0100
     * @tc.desc   Verify ConcurrentSet delete existing element returns true and element is removed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetDeleteTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      let result: boolean = set.delete(1)
      expect(result).assertTrue()
      expect(set.has(1)).assertFalse()
      expect(set.size).assertEqual(0)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetDeleteTest0200
     * @tc.number SUB_CONCURRENTSET_DELETE_TEST_0200
     * @tc.desc   Verify ConcurrentSet delete non-existing element from empty set returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetDeleteTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let result: boolean = set.delete(999)
      expect(result).assertFalse()
      expect(set.size).assertEqual(0)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetDeleteTest0300
     * @tc.number SUB_CONCURRENTSET_DELETE_TEST_0300
     * @tc.desc   Verify ConcurrentSet delete existing element returns true and has returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetDeleteTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      let result: boolean = set.delete(1)
      expect(result).assertTrue()
      expect(set.has(1)).assertFalse()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetDeleteTest0400
     * @tc.number SUB_CONCURRENTSET_DELETE_TEST_0400
     * @tc.desc   Verify ConcurrentSet delete existing number element returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetDeleteTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(123)
      expect(set.delete(123)).assertTrue()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetDeleteTest0500
     * @tc.number SUB_CONCURRENTSET_DELETE_TEST_0500
     * @tc.desc   Verify ConcurrentSet delete existing string element returns true and has returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetDeleteTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      set.add('abc')
      expect(set.delete('abc')).assertTrue()
      expect(set.has('abc')).assertFalse()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetDeleteTest0600
     * @tc.number SUB_CONCURRENTSET_DELETE_TEST_0600
     * @tc.desc   Verify ConcurrentSet delete boolean element true returns true and false remains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetDeleteTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<boolean> = new containers.ConcurrentSet<boolean>()
      set.add(true)
      set.add(false)
      expect(set.delete(true)).assertTrue()
      expect(set.has(true)).assertFalse()
      expect(set.has(false)).assertTrue()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetDeleteTest0700
     * @tc.number SUB_CONCURRENTSET_DELETE_TEST_0700
     * @tc.desc   Verify ConcurrentSet delete existing element returns true and size is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetDeleteTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      expect(set.delete(1)).assertTrue()
      expect(set.has(1)).assertFalse()
      expect(set.size).assertEqual(0)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetDeleteTest0800
     * @tc.number SUB_CONCURRENTSET_DELETE_TEST_0800
     * @tc.desc   Verify ConcurrentSet delete non-existing element from empty set returns false and size is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetDeleteTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      expect(set.delete(1)).assertFalse()
      expect(set.size).assertEqual(0)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetDeleteTest0900
     * @tc.number SUB_CONCURRENTSET_DELETE_TEST_0900
     * @tc.desc   Verify ConcurrentSet delete existing element returns true and size becomes 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetDeleteTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      expect(set.delete(1)).assertTrue()
      expect(set.size).assertEqual(0)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetDeleteTest1000
     * @tc.number SUB_CONCURRENTSET_DELETE_TEST_1000
     * @tc.desc   Verify ConcurrentSet add then delete returns true and size becomes 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetDeleteTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(42)
      expect(set.size).assertEqual(1)
      expect(set.delete(42)).assertTrue()
      expect(set.size).assertEqual(0)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetDeleteTest1100
     * @tc.number SUB_CONCURRENTSET_DELETE_TEST_1100
     * @tc.desc   Verify ConcurrentSet delete same element twice second call returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetDeleteTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      expect(set.delete(1)).assertTrue()
      expect(set.delete(1)).assertFalse()
      expect(set.delete(1)).assertFalse()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetDeleteTest1200
     * @tc.number SUB_CONCURRENTSET_DELETE_TEST_1200
     * @tc.desc   Verify ConcurrentSet delete non-existing elements from empty set returns false and size is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetDeleteTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      expect(set.delete(0)).assertFalse()
      expect(set.delete(1)).assertFalse()
      expect(set.size).assertEqual(0)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetDeleteTest1300
     * @tc.number SUB_CONCURRENTSET_DELETE_TEST_1300
     * @tc.desc   Verify ConcurrentSet delete existing element returns true and has returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetDeleteTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      expect(set.delete(1)).assertTrue()
      expect(set.has(1)).assertFalse()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetDeleteTest1400
     * @tc.number SUB_CONCURRENTSET_DELETE_TEST_1400
     * @tc.desc   Verify ConcurrentSet delete non-existing element returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetDeleteTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      expect(set.delete(999)).assertFalse()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetDeleteTest1500
     * @tc.number SUB_CONCURRENTSET_DELETE_TEST_1500
     * @tc.desc   Verify ConcurrentSet delete non-existing elements from empty set returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetDeleteTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      expect(set.delete(0)).assertFalse()
      expect(set.delete(1)).assertFalse()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetDeleteTest1600
     * @tc.number SUB_CONCURRENTSET_DELETE_TEST_1600
     * @tc.desc   Verify ConcurrentSet delete same element twice second call returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetDeleteTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      expect(set.delete(1)).assertTrue()
      expect(set.delete(1)).assertFalse()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetDeleteTest1700
     * @tc.number SUB_CONCURRENTSET_DELETE_TEST_1700
     * @tc.desc   Verify ConcurrentSet add then delete size changes from 1 to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetDeleteTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(42)
      expect(set.size).assertEqual(1)
      expect(set.delete(42)).assertTrue()
      expect(set.size).assertEqual(0)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetDeleteTest1800
     * @tc.number SUB_CONCURRENTSET_DELETE_TEST_1800
     * @tc.desc   Verify ConcurrentSet delete multiple elements from 10-element set size reduces correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetDeleteTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 10; i++) {
        set.add(i)
      }
      expect(set.size).assertEqual(10)
      expect(set.delete(0)).assertTrue()
      expect(set.delete(5)).assertTrue()
      expect(set.delete(9)).assertTrue()
      expect(set.size).assertEqual(7)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetDeleteTest1900
     * @tc.number SUB_CONCURRENTSET_DELETE_TEST_1900
     * @tc.desc   Verify ConcurrentSet delete existing string element returns true and has returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetDeleteTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      set.add('hello')
      expect(set.delete('hello')).assertTrue()
      expect(set.has('hello')).assertFalse()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetDeleteTest2000
     * @tc.number SUB_CONCURRENTSET_DELETE_TEST_2000
     * @tc.desc   Verify ConcurrentSet delete boolean element true returns true and false remains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetDeleteTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<boolean> = new containers.ConcurrentSet<boolean>()
      set.add(true)
      set.add(false)
      expect(set.delete(true)).assertTrue()
      expect(set.has(true)).assertFalse()
      expect(set.has(false)).assertTrue()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetDeleteTest2100
     * @tc.number SUB_CONCURRENTSET_DELETE_TEST_2100
     * @tc.desc   Verify ConcurrentSet delete with 10 concurrent tasks all elements removed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetDeleteTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 10; i++) {
        set.add(i)
      }
      let promises: Promise<boolean>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(deleteTaskNum(set, i))
      }
      let results: boolean[] = await Promise.all(promises)
      expect(set.size).assertEqual(0)
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertTrue()
      }
      Done()
    })

    /**
     * @tc.name   ConcurrentSetDeleteTest2200
     * @tc.number SUB_CONCURRENTSET_DELETE_TEST_2200
     * @tc.desc   Verify ConcurrentSet delete with 10 concurrent non-existing elements returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetDeleteTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      let promises: Promise<boolean>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(deleteTaskNum(set, i + 100.0))
      }
      let results: boolean[] = await Promise.all(promises)
      expect(set.size).assertEqual(1)
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertFalse()
      }
      Done()
    })

    /**
     * @tc.name   ConcurrentSetDeleteTest2300
     * @tc.number SUB_CONCURRENTSET_DELETE_TEST_2300
     * @tc.desc   Verify ConcurrentSet delete with 3 concurrent tasks all elements removed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetDeleteTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(10.0)
      set.add(20.0)
      set.add(30.0)
      await Promise.all([
        deleteTaskNum(set, 10.0),
        deleteTaskNum(set, 20.0),
        deleteTaskNum(set, 30.0)
      ])
      expect(set.size).assertEqual(0)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetDeleteTest2400
     * @tc.number SUB_CONCURRENTSET_DELETE_TEST_2400
     * @tc.desc   Verify ConcurrentSet delete with 5 concurrent string tasks all elements removed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetDeleteTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      set.add('a')
      set.add('b')
      set.add('c')
      set.add('d')
      set.add('e')
      let promises: Promise<boolean>[] = []
      let values: string[] = ['a', 'b', 'c', 'd', 'e']
      for (let i = 0; i < 5; i++) {
        promises.push(deleteTaskStr(set, values[i]))
      }
      await Promise.all(promises)
      expect(set.size).assertEqual(0)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetDeleteTest2500
     * @tc.number SUB_CONCURRENTSET_DELETE_TEST_2500
     * @tc.desc   Verify ConcurrentSet delete with 10 concurrent tasks all elements removed and size is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetDeleteTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 10; i++) {
        set.add(i)
      }
      let promises: Promise<boolean>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(deleteTaskNum(set, i))
      }
      await Promise.all(promises)
      expect(set.size).assertEqual(0)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetDeleteTest2600
     * @tc.number SUB_CONCURRENTSET_DELETE_TEST_2600
     * @tc.desc   Verify ConcurrentSet delete same element with 10 concurrent tasks only one succeeds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetDeleteTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(42)
      let promises: Promise<boolean>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(deleteSameTask(set))
      }
      let results: boolean[] = await Promise.all(promises)
      expect(set.size).assertEqual(0)
      let successCount: number = 0
      for (let i = 0; i < results.length; i++) {
        if (results[i]) {
          successCount++
        }
      }
      expect(successCount).assertEqual(1)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetDeleteTest2700
     * @tc.number SUB_CONCURRENTSET_DELETE_TEST_2700
     * @tc.desc   Verify ConcurrentSet delete inside TaskPool task returns true for existing element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetDeleteTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result: boolean = await outerTaskDeleteExist()
      expect(result).assertTrue()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetDeleteTest2800
     * @tc.number SUB_CONCURRENTSET_DELETE_TEST_2800
     * @tc.desc   Verify ConcurrentSet delete inside TaskPool task returns false for non-existing element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetDeleteTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result: boolean = await outerTaskDeleteNotExist()
      expect(result).assertFalse()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetDeleteTest2900
     * @tc.number SUB_CONCURRENTSET_DELETE_TEST_2900
     * @tc.desc   Verify ConcurrentSet delete inside TaskPool task size is correct after deletion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetDeleteTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result: int = await outerTaskDeleteSize()
      expect(result).assertEqual(1)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetDeleteTest3000
     * @tc.number SUB_CONCURRENTSET_DELETE_TEST_3000
     * @tc.desc   Verify ConcurrentSet delete inside onExecutionSucceeded callback removes all elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetDeleteTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let promises: Promise<void>[] = []
      for (let i = 1; i <= 3; i++) {
        promises.push(deleteTaskInCallback(set, i))
      }
      await Promise.all(promises)
      expect(set.size).assertEqual(0)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetDeleteTest3100
     * @tc.number SUB_CONCURRENTSET_DELETE_TEST_3100
     * @tc.desc   Verify ConcurrentSet delete inside onReceiveData callback removes all elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetDeleteTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(10)
      set.add(20)
      set.add(30)
      let promises: Promise<boolean>[] = []
      let vals: number[] = [10, 20, 30]
      for (let j = 0; j < vals.length; j++) {
        promises.push(deleteTaskNum(set, vals[j]))
      }
      let results: boolean[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertTrue()
      }
      expect(set.size).assertEqual(0)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetDeleteTest3200
     * @tc.number SUB_CONCURRENTSET_DELETE_TEST_3200
     * @tc.desc   Verify ConcurrentSet delete with 10 concurrent tasks all elements removed and size is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetDeleteTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 10; i++) {
        set.add(i)
      }
      let promises: Promise<boolean>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(deleteTaskNum(set, i))
      }
      let results: boolean[] = await Promise.all(promises)
      expect(set.size).assertEqual(0)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetDeleteTest3300
     * @tc.number SUB_CONCURRENTSET_DELETE_TEST_3300
     * @tc.desc   Verify ConcurrentSet delete inside onExecutionSucceeded callback removes all elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetDeleteTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let promises: Promise<void>[] = []
      for (let i = 1; i <= 3; i++) {
        promises.push(deleteTaskInCallback(set, i))
      }
      await Promise.all(promises)
      expect(set.size).assertEqual(0)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetDeleteTest3400
     * @tc.number SUB_CONCURRENTSET_DELETE_TEST_3400
     * @tc.desc   Verify ConcurrentSet delete inside onReceiveData callback removes all elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetDeleteTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(10)
      set.add(20)
      set.add(30)
      let promises: Promise<boolean>[] = []
      let vals: number[] = [10, 20, 30]
      for (let j = 0; j < vals.length; j++) {
        promises.push(deleteTaskNum(set, vals[j]))
      }
      let results: boolean[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertTrue()
      }
      expect(set.size).assertEqual(0)
      Done()
    })
  })
}
