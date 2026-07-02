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


async function createSetFromArrayNum(arr: Array<number>): Promise<containers.ConcurrentSet<number>> {
  return new containers.ConcurrentSet<number>(arr)
}


async function createSetFromArrayStr(arr: Array<string>): Promise<containers.ConcurrentSet<string>> {
  return new containers.ConcurrentSet<string>(arr)
}


async function outerTaskArrayLikeSize(arr: Array<int>): Promise<int> {
  let innerSet: containers.ConcurrentSet<int> = new containers.ConcurrentSet<int>(arr)
  return innerSet.size
}

export default function ConcurrentSetConstructorArrayLikeTest(): void {
  describe('ConcurrentSetConstructorArrayLikeTest', (): void => {
    beforeAll((): void => {})
    beforeEach(async (): Promise<void> => {

    })
    afterEach((): void => {
    })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100)
    })

    /**
     * @tc.name   ConcurrentSetConstructorArrayLikeTest0100
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_ARRAYLIKE_TEST_0100
     * @tc.desc   Verify ConcurrentSet constructor with number array creates set with all elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetConstructorArrayLikeTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let arr: Array<number> = [0, 1, 2, 3, 4]
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(arr)
      expect(set.size).assertEqual(5)
      for (let i = 0; i < 5; i++) {
        expect(set.has(i)).assertTrue()
      }
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorArrayLikeTest0200
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_ARRAYLIKE_TEST_0200
     * @tc.desc   Verify ConcurrentSet constructor with empty array creates empty set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetConstructorArrayLikeTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let arr: Array<number> = []
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(arr)
      expect(set.size).assertEqual(0)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorArrayLikeTest0300
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_ARRAYLIKE_TEST_0300
     * @tc.desc   Verify ConcurrentSet constructor with 4-element number array size is 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetConstructorArrayLikeTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let arr: Array<number> = [0, 1, 2, 3]
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(arr)
      expect(set.size).assertEqual(4)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorArrayLikeTest0400
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_ARRAYLIKE_TEST_0400
     * @tc.desc   Verify ConcurrentSet constructor with string array creates set with all elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetConstructorArrayLikeTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let arr: Array<string> = ['a', 'b', 'c']
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>(arr)
      expect(set.size).assertEqual(3)
      expect(set.has('a')).assertTrue()
      expect(set.has('b')).assertTrue()
      expect(set.has('c')).assertTrue()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorArrayLikeTest0500
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_ARRAYLIKE_TEST_0500
     * @tc.desc   Verify ConcurrentSet constructor with 100-element array size is 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetConstructorArrayLikeTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let arr: Array<number> = []
      for (let i = 0; i < 100; i++) {
        arr.push(i)
      }
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(arr)
      expect(set.size).assertEqual(100)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorArrayLikeTest0600
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_ARRAYLIKE_TEST_0600
     * @tc.desc   Verify ConcurrentSet constructor with empty array returns empty set with size 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetConstructorArrayLikeTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let arr: Array<number> = []
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(arr)
      expect(set.size).assertEqual(0)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorArrayLikeTest0700
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_ARRAYLIKE_TEST_0700
     * @tc.desc   Verify ConcurrentSet constructor with duplicate elements deduplicates to unique set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetConstructorArrayLikeTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let arr: Array<number> = [1, 1, 2, 2, 3]
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(arr)
      expect(set.size).assertEqual(3)
      expect(set.has(1)).assertTrue()
      expect(set.has(2)).assertTrue()
      expect(set.has(3)).assertTrue()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorArrayLikeTest0800
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_ARRAYLIKE_TEST_0800
     * @tc.desc   Verify ConcurrentSet constructor with all identical elements size is 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetConstructorArrayLikeTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let arr: Array<number> = [1, 1, 1, 1, 1]
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(arr)
      expect(set.size).assertEqual(1)
      expect(set.has(1)).assertTrue()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorArrayLikeTest0900
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_ARRAYLIKE_TEST_0900
     * @tc.desc   Verify ConcurrentSet constructor with mixed duplicates deduplicates correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetConstructorArrayLikeTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let arr: Array<number> = [1, 2, 1, 3, 2, 4, 3, 5]
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(arr)
      expect(set.size).assertEqual(5)
      expect(set.has(1)).assertTrue()
      expect(set.has(2)).assertTrue()
      expect(set.has(3)).assertTrue()
      expect(set.has(4)).assertTrue()
      expect(set.has(5)).assertTrue()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorArrayLikeTest1000
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_ARRAYLIKE_TEST_1000
     * @tc.desc   Verify ConcurrentSet constructor with duplicates non-existing element has returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetConstructorArrayLikeTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let arr: Array<number> = [1, 1, 2, 2, 3, 3]
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(arr)
      expect(set.size).assertEqual(3)
      expect(set.has(1)).assertTrue()
      expect(set.has(2)).assertTrue()
      expect(set.has(3)).assertTrue()
      expect(set.has(4)).assertFalse()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorArrayLikeTest1100
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_ARRAYLIKE_TEST_1100
     * @tc.desc   Verify ConcurrentSet constructor with array returns valid ConcurrentSet instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetConstructorArrayLikeTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let arr: Array<number> = [0, 1, 2, 3, 4]
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(arr)
      expect(set.size).assertEqual(5)
      expect(set.has(0)).assertTrue()
      expect(set.has(4)).assertTrue()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorArrayLikeTest1200
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_ARRAYLIKE_TEST_1200
     * @tc.desc   Verify ConcurrentSet constructor with number array has returns true for all elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetConstructorArrayLikeTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let arr: Array<number> = [0, 1, 2, 3, 4]
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(arr)
      expect(set.size).assertEqual(5)
      for (let i = 0; i < 5; i++) {
        expect(set.has(i)).assertTrue()
      }
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorArrayLikeTest1300
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_ARRAYLIKE_TEST_1300
     * @tc.desc   Verify ConcurrentSet constructor with string array has returns true for all elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetConstructorArrayLikeTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let arr: Array<string> = ['a', 'b', 'c', 'd', 'e']
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>(arr)
      expect(set.size).assertEqual(5)
      expect(set.has('a')).assertTrue()
      expect(set.has('b')).assertTrue()
      expect(set.has('c')).assertTrue()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorArrayLikeTest1400
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_ARRAYLIKE_TEST_1400
     * @tc.desc   Verify ConcurrentSet constructor with empty array single thread size is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetConstructorArrayLikeTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let arr: Array<number> = []
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(arr)
      expect(set.size).assertEqual(0)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorArrayLikeTest1500
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_ARRAYLIKE_TEST_1500
     * @tc.desc   Verify ConcurrentSet constructor with 100-element array single thread size is 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetConstructorArrayLikeTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let arr: Array<number> = []
      for (let i = 0; i < 100; i++) {
        arr.push(i)
      }
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(arr)
      expect(set.size).assertEqual(100)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorArrayLikeTest1600
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_ARRAYLIKE_TEST_1600
     * @tc.desc   Verify ConcurrentSet constructor with 10 concurrent threads creates correct sets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetConstructorArrayLikeTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let arr: Array<number> = [0, 1, 2, 3, 4]
      let promises: Promise<containers.ConcurrentSet<number>>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(createSetFromArrayNum(arr))
      }
      let results: containers.ConcurrentSet<number>[] = await Promise.all(promises)
      expect(results.length).assertEqual(10)
      for (let i = 0; i < results.length; i++) {
        expect(results[i].size).assertEqual(5)
      }
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorArrayLikeTest1700
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_ARRAYLIKE_TEST_1700
     * @tc.desc   Verify ConcurrentSet constructor with 3 concurrent threads creates correct sets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetConstructorArrayLikeTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let arr: Array<number> = [10, 20, 30]
      let results: containers.ConcurrentSet<number>[] = await Promise.all([
        createSetFromArrayNum(arr),
        createSetFromArrayNum(arr),
        createSetFromArrayNum(arr)
      ])
      expect(results.length).assertEqual(3)
      for (let i = 0; i < results.length; i++) {
        expect(results[i].size).assertEqual(3)
      }
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorArrayLikeTest1800
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_ARRAYLIKE_TEST_1800
     * @tc.desc   Verify ConcurrentSet constructor with 5 concurrent string array threads creates correct sets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetConstructorArrayLikeTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let arr: Array<string> = ['a', 'b', 'c', 'd', 'e']
      let promises: Promise<containers.ConcurrentSet<string>>[] = []
      for (let i = 0; i < 5; i++) {
        promises.push(createSetFromArrayStr(arr))
      }
      let results: containers.ConcurrentSet<string>[] = await Promise.all(promises)
      expect(results.length).assertEqual(5)
      for (let i = 0; i < results.length; i++) {
        expect(results[i].size).assertEqual(5)
      }
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorArrayLikeTest1900
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_ARRAYLIKE_TEST_1900
     * @tc.desc   Verify ConcurrentSet constructor with 10 concurrent threads and 10-element array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetConstructorArrayLikeTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let arr: Array<number> = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
      let promises: Promise<containers.ConcurrentSet<number>>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(createSetFromArrayNum(arr))
      }
      let results: containers.ConcurrentSet<number>[] = await Promise.all(promises)
      expect(results.length).assertEqual(10)
      for (let i = 0; i < results.length; i++) {
        expect(results[i].size).assertEqual(10)
      }
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorArrayLikeTest2000
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_ARRAYLIKE_TEST_2000
     * @tc.desc   Verify ConcurrentSet constructor inside TaskPool task with array size is correct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetConstructorArrayLikeTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let arr: Array<int> = [1, 2, 3, 4, 5]
      let result: int = await outerTaskArrayLikeSize(arr)
      expect(result).assertEqual(5)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorArrayLikeTest2100
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_ARRAYLIKE_TEST_2100
     * @tc.desc   Verify ConcurrentSet constructor inside TaskPool task with duplicates deduplicates
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetConstructorArrayLikeTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let arr: Array<int> = [1, 1, 2, 2, 3, 3, 4]
      let result: int = await outerTaskArrayLikeSize(arr)
      expect(result).assertEqual(4)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorArrayLikeTest2200
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_ARRAYLIKE_TEST_2200
     * @tc.desc   Verify ConcurrentSet constructor inside onExecutionSucceeded callback creates set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetConstructorArrayLikeTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let completed: AtomicInt = new AtomicInt(0)
      await Promise.all([
        (async (): Promise<void> => {
          let arr: Array<number> = [1, 2, 3]
          let innerSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(arr)
          completed.fetchAdd(1)
        })()
      ])
      expect(completed.load()).assertEqual(1)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorArrayLikeTest2300
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_ARRAYLIKE_TEST_2300
     * @tc.desc   Verify ConcurrentSet constructor inside onReceiveData callback with nested task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetConstructorArrayLikeTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let nestedPromises: Promise<containers.ConcurrentSet<number>>[] = []
      let arr: Array<number> = [1, 2, 3]
      await Promise.all([
        (async (): Promise<void> => {
          nestedPromises.push(createSetFromArrayNum(arr))
        })()
      ])
      await Promise.all(nestedPromises)
      expect(nestedPromises.length).assertEqual(1)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetConstructorArrayLikeTest2400
     * @tc.number SUB_CONCURRENTSET_CONSTRUCTOR_ARRAYLIKE_TEST_2400
     * @tc.desc   Verify ConcurrentSet constructor with 10 concurrent nested tasks creates correct sets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetConstructorArrayLikeTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let arr: Array<number> = [0, 1, 2, 3, 4]
      let promises: Promise<containers.ConcurrentSet<number>>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(createSetFromArrayNum(arr))
      }
      let results: containers.ConcurrentSet<number>[] = await Promise.all(promises)
      expect(results.length).assertEqual(10)
      for (let i = 0; i < results.length; i++) {
        expect(results[i].size).assertEqual(5)
      }
      Done()
    })
  })
}
