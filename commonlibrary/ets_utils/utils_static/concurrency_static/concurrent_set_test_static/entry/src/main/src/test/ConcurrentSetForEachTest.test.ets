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


import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium-binary/src/main/indexStatic'
import Utils from './Util.test'


async function forEachTaskNum(s: containers.ConcurrentSet<int>): Promise<int> {
  let count: AtomicInt = new AtomicInt(0)
  s.forEach((value: int) => {
    count.fetchAdd(1)
  })
  return count.load()
}


async function forEachTaskStr(s: containers.ConcurrentSet<string>): Promise<int> {
  let count: AtomicInt = new AtomicInt(0)
  s.forEach((value: string) => {
    count.fetchAdd(1)
  })
  return count.load()
}


async function outerTaskForEachCount(): Promise<number> {
  let innerSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
  innerSet.add(1)
  innerSet.add(2)
  innerSet.add(3)
  let count: number = 0
  innerSet.forEach((value: number) => {
    count++
  })
  return count
}


async function outerTaskForEachEmpty(): Promise<number> {
  let innerSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
  let count: number = 0
  innerSet.forEach((value: number) => {
    count++
  })
  return count
}


async function forEachTaskInCallback(s: containers.ConcurrentSet<int>): Promise<int> {
  let count: AtomicInt = new AtomicInt(0)
  s.forEach((value: int) => {
    count.fetchAdd(1)
  })
  return count.load()
}



export default function ConcurrentSetForEachTest(): void {
  describe('ConcurrentSetForEachTest', (): void => {
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
     * @tc.name ConcurrentSetForEachTest0100
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_0100
     * @tc.desc   Test forEach() on number set with 3 elements verifying count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetForEachTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let count: number = 0
      set.forEach((value: number) => {
        count++
      })
      expect(count).assertEqual(3)
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest0200
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_0200
     * @tc.desc   Test forEach() on empty set verifying count equals 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetForEachTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let count: number = 0
      set.forEach((value: number) => {
        count++
      })
      expect(count).assertEqual(0)
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest0300
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_0300
     * @tc.desc   Test forEach() traversal count equals 3 on number set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetForEachTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let count: number = 0
      set.forEach((value: number) => {
        count++
      })
      expect(count).assertEqual(3)
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest0400
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_0400
     * @tc.desc   Test forEach() on string type set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetForEachTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      set.add('a')
      set.add('b')
      set.add('c')
      let count: number = 0
      set.forEach((value: string) => {
        count++
      })
      expect(count).assertEqual(3)
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest0500
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_0500
     * @tc.desc   Test forEach() on empty set verifying count equals 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetForEachTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let count: number = 0
      set.forEach((value: number) => {
        count++
      })
      expect(count).assertEqual(0)
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest0600
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_0600
     * @tc.desc   Test forEach() on set with 100 elements verifying count equals 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetForEachTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 100; i++) {
        set.add(i)
      }
      let count: number = 0
      set.forEach((value: number) => {
        count++
      })
      expect(count).assertEqual(100)
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest0700
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_0700
     * @tc.desc   Test forEach() collecting values and verifying existence via has()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetForEachTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let vals: number[] = []
      set.forEach((value: number) => {
        vals.push(value)
      })
      expect(vals.length).assertEqual(3)
      for (let i = 0; i < vals.length; i++) {
        expect(set.has(vals[i])).assertTrue()
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest0800
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_0800
     * @tc.desc   Test forEach() traversal count equals 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetForEachTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let count: number = 0
      set.forEach((value: number) => {
        count++
      })
      expect(count).assertEqual(3)
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest0900
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_0900
     * @tc.desc   Test forEach() on 3-element number set verifying count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetForEachTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let count: number = 0
      set.forEach((value: number) => {
        count++
      })
      expect(count).assertEqual(3)
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest1000
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_1000
     * @tc.desc   Test forEach() on string type set verifying count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetForEachTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      set.add('a')
      set.add('b')
      set.add('c')
      let count: number = 0
      set.forEach((value: string) => {
        count++
      })
      expect(count).assertEqual(3)
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest1100
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_1100
     * @tc.desc   Test forEach() on empty set verifying count equals 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetForEachTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let count: number = 0
      set.forEach((value: number) => {
        count++
      })
      expect(count).assertEqual(0)
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest1200
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_1200
     * @tc.desc   Test forEach() on set with 100 elements verifying count equals 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetForEachTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 100; i++) {
        set.add(i)
      }
      let count: number = 0
      set.forEach((value: number) => {
        count++
      })
      expect(count).assertEqual(100)
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest1300
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_1300
     * @tc.desc   Test double forEach() on same set verifying both traverse all elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetForEachTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let count1: number = 0
      let count2: number = 0
      set.forEach((value: number) => {
        count1++
      })
      set.forEach((value: number) => {
        count2++
      })
      expect(count1).assertEqual(3)
      expect(count2).assertEqual(3)
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest1400
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_1400
     * @tc.desc   Test forEach() count equals set.size property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetForEachTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let count: number = 0
      set.forEach((value: number) => {
        count++
      })
      expect(count).assertEqual(set.size)
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest1500
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_1500
     * @tc.desc   Test forEach() collecting values and verifying existence via has()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetForEachTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let vals: number[] = []
      set.forEach((value: number) => {
        vals.push(value)
      })
      expect(vals.length).assertEqual(3)
      for (let i = 0; i < vals.length; i++) {
        expect(set.has(vals[i])).assertTrue()
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest1600
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_1600
     * @tc.desc   Test forEach() on string type set verifying traversal count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetForEachTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      set.add('a')
      set.add('b')
      set.add('c')
      let count: number = 0
      set.forEach((value: string) => {
        count++
      })
      expect(count).assertEqual(3)
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest1700
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_1700
     * @tc.desc   Test forEach() on empty set verifying count equals 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetForEachTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let count: number = 0
      set.forEach((value: number) => {
        count++
      })
      expect(count).assertEqual(0)
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest1800
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_1800
     * @tc.desc   Test forEach() on set with 100 elements verifying count equals 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetForEachTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 100; i++) {
        set.add(i)
      }
      let count: number = 0
      set.forEach((value: number) => {
        count++
      })
      expect(count).assertEqual(100)
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest1900
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_1900
     * @tc.desc   Test forEach() collecting values into array verifying length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetForEachTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let vals: number[] = []
      set.forEach((value: number) => {
        vals.push(value)
      })
      expect(vals.length).assertEqual(3)
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest2000
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_2000
     * @tc.desc   Test forEach() traversal count equals 3 on number set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetForEachTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let count: number = 0
      set.forEach((value: number) => {
        count++
      })
      expect(count).assertEqual(3)
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest2100
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_2100
     * @tc.desc   Test forEach() on 3-element number set verifying count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetForEachTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let count: number = 0
      set.forEach((value: number) => {
        count++
      })
      expect(count).assertEqual(3)
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest2200
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_2200
     * @tc.desc   Test forEach() on string type set verifying count equals 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetForEachTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      set.add('a')
      set.add('b')
      set.add('c')
      let count: number = 0
      set.forEach((value: string) => {
        count++
      })
      expect(count).assertEqual(3)
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest2300
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_2300
     * @tc.desc   Test forEach() on empty set verifying count equals 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetForEachTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let count: number = 0
      set.forEach((value: number) => {
        count++
      })
      expect(count).assertEqual(0)
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest2400
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_2400
     * @tc.desc   Test forEach() on set with 100 elements verifying count equals 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetForEachTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 100; i++) {
        set.add(i)
      }
      let count: number = 0
      set.forEach((value: number) => {
        count++
      })
      expect(count).assertEqual(100)
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest2500
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_2500
     * @tc.desc   Test double forEach() on same set verifying both traverse all elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetForEachTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let count1: number = 0
      let count2: number = 0
      set.forEach((value: number) => {
        count1++
      })
      set.forEach((value: number) => {
        count2++
      })
      expect(count1).assertEqual(3)
      expect(count2).assertEqual(3)
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest2600
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_2600
     * @tc.desc   Test forEach() count equals set.size property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetForEachTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let count: number = 0
      set.forEach((value: number) => {
        count++
      })
      expect(count).assertEqual(set.size)
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest2700
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_2700
     * @tc.desc   Test forEach() collecting values and verifying existence via has()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetForEachTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let vals: number[] = []
      set.forEach((value: number) => {
        vals.push(value)
      })
      expect(vals.length).assertEqual(3)
      for (let i = 0; i < vals.length; i++) {
        expect(set.has(vals[i])).assertTrue()
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest2800
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_2800
     * @tc.desc   Test forEach() traversal count equals 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetForEachTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let count: number = 0
      set.forEach((value: number) => {
        count++
      })
      expect(count).assertEqual(3)
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest2900
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_2900
     * @tc.desc   Test forEach() on 5-element number set verifying count equals 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetForEachTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      set.add(4)
      set.add(5)
      let count: number = 0
      set.forEach((value: number) => {
        count++
      })
      expect(count).assertEqual(5)
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest3000
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_3000
     * @tc.desc   Test forEach() sum of values equals expected total
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetForEachTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let sum: number = 0
      set.forEach((value: number) => {
        sum += value
      })
      expect(sum).assertEqual(6)
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest3100
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_3100
     * @tc.desc   Test forEach() on string type set concatenating values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetForEachTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      set.add('a')
      set.add('b')
      set.add('c')
      let result: string = ''
      set.forEach((value: string) => {
        result += value
      })
      expect(result.length).assertEqual(3)
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest3200
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_3200
     * @tc.desc   Test forEach() concurrently with 10 async tasks on number set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetForEachTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<int> = new containers.ConcurrentSet<int>()
      for (let i = 0; i < 10; i++) {
        set.add(i)
      }
      let promises: Promise<int>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(forEachTaskNum(set))
      }
      let results: int[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(10)
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest3300
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_3300
     * @tc.desc   Test forEach() concurrently on empty set via async verifying count equals 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetForEachTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<int> = new containers.ConcurrentSet<int>()
      let promises: Promise<int>[] = []
      for (let i = 0; i < 5; i++) {
        promises.push(forEachTaskNum(set))
      }
      let results: int[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(0)
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest3400
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_3400
     * @tc.desc   Test forEach() concurrently with 3 specific async tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetForEachTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<int> = new containers.ConcurrentSet<int>()
      set.add(10)
      set.add(20)
      set.add(30)
      let results: int[] = await Promise.all([
        forEachTaskNum(set),
        forEachTaskNum(set),
        forEachTaskNum(set)
      ])
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(3)
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest3500
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_3500
     * @tc.desc   Test forEach() concurrently on string type set with 5 async tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetForEachTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      set.add('a')
      set.add('b')
      set.add('c')
      set.add('d')
      set.add('e')
      let promises: Promise<int>[] = []
      for (let i = 0; i < 5; i++) {
        promises.push(forEachTaskStr(set))
      }
      let results: int[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(5)
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest3600
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_3600
     * @tc.desc   Test forEach() concurrently with 10 tasks on 10-element set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetForEachTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<int> = new containers.ConcurrentSet<int>()
      for (let i = 0; i < 10; i++) {
        set.add(i)
      }
      let promises: Promise<int>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(forEachTaskNum(set))
      }
      let results: int[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(10)
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest3700
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_3700
     * @tc.desc   Test forEach() in outer async task with 3 elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetForEachTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result: number = await outerTaskForEachCount()
      expect(result).assertEqual(3)
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest3800
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_3800
     * @tc.desc   Test forEach() in outer async task on empty set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetForEachTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result: number = await outerTaskForEachEmpty()
      expect(result).assertEqual(0)
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest3900
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_3900
     * @tc.desc   Test forEach() in nested task via onExecutionSucceeded callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetForEachTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<int> = new containers.ConcurrentSet<int>()
      set.add(1)
      set.add(2)
      set.add(3)
      let results: int[] = await Promise.all([forEachTaskInCallback(set)])
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(3)
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest4000
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_4000
     * @tc.desc   Test forEach() in nested task via onReceiveData callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetForEachTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<int> = new containers.ConcurrentSet<int>()
      set.add(1)
      set.add(2)
      set.add(3)
      let results: int[] = await Promise.all([forEachTaskInCallback(set)])
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(3)
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest4100
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_4100
     * @tc.desc   Test forEach() concurrently with 10 tasks verifying count equals 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetForEachTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<int> = new containers.ConcurrentSet<int>()
      for (let i = 0; i < 10; i++) {
        set.add(i)
      }
      let promises: Promise<int>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(forEachTaskNum(set))
      }
      let results: int[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(10)
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest4200
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_4200
     * @tc.desc   Test forEach() in nested task via onExecutionSucceeded callback with 3-element set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetForEachTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<int> = new containers.ConcurrentSet<int>()
      set.add(1)
      set.add(2)
      set.add(3)
      let results: int[] = await Promise.all([forEachTaskInCallback(set)])
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(3)
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest4300
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_4300
     * @tc.desc   Test forEach() on 3-element number set verifying traversal count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetForEachTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let count: number = 0
      set.forEach((value: number) => {
        count++
      })
      expect(count).assertEqual(3)
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest4400
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_4400
     * @tc.desc   Test forEach() on empty set verifying count equals 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetForEachTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let count: number = 0
      set.forEach((value: number) => {
        count++
      })
      expect(count).assertEqual(0)
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest4500
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_4500
     * @tc.desc   Test forEach() on string type set with xyz elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetForEachTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      set.add('x')
      set.add('y')
      set.add('z')
      let count: number = 0
      set.forEach((value: string) => {
        count++
      })
      expect(count).assertEqual(3)
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest4600
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_4600
     * @tc.desc   Test forEach() on single-element set verifying value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetForEachTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      let count: number = 0
      set.forEach((value: number) => {
        expect(value).assertEqual(1)
        count++
      })
      expect(count).assertEqual(1)
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest4700
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_4700
     * @tc.desc   Test double forEach() on 2-element set verifying both traverse all elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetForEachTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      let count1: number = 0
      let count2: number = 0
      set.forEach((value: number) => {
        count1++
      })
      set.forEach((value: number) => {
        count2++
      })
      expect(count1).assertEqual(2)
      expect(count2).assertEqual(2)
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest4800
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_4800
     * @tc.desc   Test forEach() count equals set.size property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetForEachTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let count: number = 0
      set.forEach((value: number) => {
        count++
      })
      expect(count).assertEqual(set.size)
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest4900
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_4900
     * @tc.desc   Test forEach() collecting values and verifying existence via has()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetForEachTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let vals: number[] = []
      set.forEach((value: number) => {
        vals.push(value)
      })
      expect(vals.length).assertEqual(3)
      for (let i = 0; i < vals.length; i++) {
        expect(set.has(vals[i])).assertTrue()
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest5000
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_5000
     * @tc.desc   Test forEach() sum of values equals expected total
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetForEachTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let sum: number = 0
      set.forEach((value: number) => {
        sum += value
      })
      expect(sum).assertEqual(6)
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest5100
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_5100
     * @tc.desc   Test forEach() on 5-element number set verifying count equals 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetForEachTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      set.add(4)
      set.add(5)
      let count: number = 0
      set.forEach((value: number) => {
        count++
      })
      expect(count).assertEqual(5)
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest5200
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_5200
     * @tc.desc   Test forEach() on string type set concatenating values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetForEachTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      set.add('a')
      set.add('b')
      set.add('c')
      let result: string = ''
      set.forEach((value: string) => {
        result += value
      })
      expect(result.length).assertEqual(3)
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest5300
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_5300
     * @tc.desc   Test forEach() on 3-element number set verifying count equals 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetForEachTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let count: number = 0
      set.forEach((value: number) => {
        count++
      })
      expect(count).assertEqual(3)
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest5400
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_5400
     * @tc.desc   Test forEach() concurrently with 10 async tasks on 10-element set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetForEachTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<int> = new containers.ConcurrentSet<int>()
      for (let i = 0; i < 10; i++) {
        set.add(i)
      }
      let promises: Promise<int>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(forEachTaskNum(set))
      }
      let results: int[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(10)
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest5500
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_5500
     * @tc.desc   Test forEach() in nested task via onReceiveData callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetForEachTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<int> = new containers.ConcurrentSet<int>()
      set.add(1)
      set.add(2)
      set.add(3)
      let results: int[] = await Promise.all([forEachTaskInCallback(set)])
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(3)
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest5600
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_5600
     * @tc.desc   Test forEach() on 3-element number set verifying traversal count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetForEachTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let count: number = 0
      set.forEach((value: number) => {
        count++
      })
      expect(count).assertEqual(3)
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest5700
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_5700
     * @tc.desc   Test forEach() on empty set verifying count equals 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetForEachTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let count: number = 0
      set.forEach((value: number) => {
        count++
      })
      expect(count).assertEqual(0)
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest5800
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_5800
     * @tc.desc   Test forEach() collecting values and verifying existence via has()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetForEachTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let vals: number[] = []
      set.forEach((value: number) => {
        vals.push(value)
      })
      expect(vals.length).assertEqual(3)
      for (let i = 0; i < vals.length; i++) {
        expect(set.has(vals[i])).assertTrue()
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest5900
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_5900
     * @tc.desc   Test forEach() in nested task via onExecutionSucceeded callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetForEachTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<int> = new containers.ConcurrentSet<int>()
      set.add(1)
      set.add(2)
      set.add(3)
      let results: int[] = await Promise.all([forEachTaskInCallback(set)])
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(3)
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest6000
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_6000
     * @tc.desc   Test forEach() on 5-element number set verifying count equals 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetForEachTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      set.add(4)
      set.add(5)
      let count: number = 0
      set.forEach((value: number) => {
        count++
      })
      expect(count).assertEqual(5)
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest6100
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_6100
     * @tc.desc   Test forEach() sum of values equals expected total
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetForEachTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let sum: number = 0
      set.forEach((value: number) => {
        sum += value
      })
      expect(sum).assertEqual(6)
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest6200
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_6200
     * @tc.desc   Test forEach() on string type set concatenating values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetForEachTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      set.add('a')
      set.add('b')
      set.add('c')
      let result: string = ''
      set.forEach((value: string) => {
        result += value
      })
      expect(result.length).assertEqual(3)
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest6300
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_6300
     * @tc.desc   Test double forEach() on same set verifying both traverse all elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetForEachTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let count1: number = 0
      let count2: number = 0
      set.forEach((value: number) => {
        count1++
      })
      set.forEach((value: number) => {
        count2++
      })
      expect(count1).assertEqual(3)
      expect(count2).assertEqual(3)
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest6400
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_6400
     * @tc.desc   Test forEach() count equals set.size property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetForEachTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let count: number = 0
      set.forEach((value: number) => {
        count++
      })
      expect(count).assertEqual(set.size)
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest6500
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_6500
     * @tc.desc   Test forEach() concurrently with 10 async tasks on 10-element set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetForEachTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<int> = new containers.ConcurrentSet<int>()
      for (let i = 0; i < 10; i++) {
        set.add(i)
      }
      let promises: Promise<int>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(forEachTaskNum(set))
      }
      let results: int[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(10)
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest6600
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_6600
     * @tc.desc   Test forEach() in nested task via onReceiveData callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetForEachTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<int> = new containers.ConcurrentSet<int>()
      set.add(1)
      set.add(2)
      set.add(3)
      let results: int[] = await Promise.all([forEachTaskInCallback(set)])
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(3)
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest6700
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_6700
     * @tc.desc   Test forEach() on 3-element number set verifying traversal count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetForEachTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<int> = new containers.ConcurrentSet<int>()
      set.add(1)
      set.add(2)
      set.add(3)
      let count: int = 0
      set.forEach((value: int) => {
        count++
      })
      expect(count).assertEqual(3)
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest6800
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_6800
     * @tc.desc   Test forEach() on empty set verifying count equals 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetForEachTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<int> = new containers.ConcurrentSet<int>()
      let count: number = 0
      let callbackExecuted: boolean = false

      set.forEach((value: int, key?: int, collection?: containers.ConcurrentSet<int>) => {
        callbackExecuted = true
        count++
      })

      expect(count).assertEqual(0)
      expect(callbackExecuted).assertFalse()
      expect(set.has(1)).assertFalse()
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest6900
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_6900
     * @tc.desc   Test forEach() collecting values into array verifying length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetForEachTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let vals: number[] = []
      set.forEach((value: number) => {
        vals.push(value)
      })
      expect(vals.length).assertEqual(3)
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest7000
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_7000
     * @tc.desc   Test forEach() sum of values equals expected total
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetForEachTest7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let sum: number = 0
      set.forEach((value: number) => {
        sum += value
      })
      expect(sum).assertEqual(6)
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest7100
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_7100
     * @tc.desc   Test forEach() in nested task via onExecutionSucceeded callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetForEachTest7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<int> = new containers.ConcurrentSet<int>()
      set.add(1)
      set.add(2)
      set.add(3)
      let results: int[] = await Promise.all([forEachTaskInCallback(set)])
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(3)
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest7200
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_7200
     * @tc.desc   Test forEach() on 5-element number set verifying count equals 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetForEachTest7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      set.add(4)
      set.add(5)
      let count: number = 0
      set.forEach((value: number) => {
        count++
      })
      expect(count).assertEqual(5)
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest7300
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_7300
     * @tc.desc   Test forEach() on string type set concatenating values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetForEachTest7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      set.add('a')
      set.add('b')
      set.add('c')
      let result: string = ''
      set.forEach((value: string) => {
        result += value
      })
      expect(result.length).assertEqual(3)
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest7400
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_7400
     * @tc.desc   Test forEach() concurrently with 10 async tasks on 10-element set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetForEachTest7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<int> = new containers.ConcurrentSet<int>()
      for (let i = 0; i < 10; i++) {
        set.add(i)
      }
      let promises: Promise<int>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(forEachTaskNum(set))
      }
      let results: int[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(10)
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest7500
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_7500
     * @tc.desc   Test forEach() in nested task via onReceiveData callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetForEachTest7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<int> = new containers.ConcurrentSet<int>()
      set.add(1)
      set.add(2)
      set.add(3)
      let results: int[] = await Promise.all([forEachTaskInCallback(set)])
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(3)
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest7600
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_7600
     * @tc.desc   Test double forEach() on same set verifying both traverse all elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetForEachTest7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let count1: number = 0
      let count2: number = 0
      set.forEach((value: number) => {
        count1++
      })
      set.forEach((value: number) => {
        count2++
      })
      expect(count1).assertEqual(3)
      expect(count2).assertEqual(3)
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest7700
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_7700
     * @tc.desc   Test forEach() count equals set.size property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetForEachTest7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let count: number = 0
      set.forEach((value: number) => {
        count++
      })
      expect(count).assertEqual(set.size)
      Done()
    })

    /**
     * @tc.name ConcurrentSetForEachTest7800
     * @tc.number SUB_CONCURRENTSET_FOREACH_TEST_7800
     * @tc.desc   Test forEach() in nested task via onExecutionSucceeded callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetForEachTest7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<int> = new containers.ConcurrentSet<int>()
      set.add(1)
      set.add(2)
      set.add(3)
      let results: int[] = await Promise.all([forEachTaskInCallback(set)])
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(3)
      }
      Done()
    })
  })
}
