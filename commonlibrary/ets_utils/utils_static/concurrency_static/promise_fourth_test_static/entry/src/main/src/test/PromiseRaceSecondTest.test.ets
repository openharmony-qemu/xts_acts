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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium/index';

class CustomError extends Error {
  constructor(message: string) {
    super(message)
    this.name = "CustomError"
  }
}

interface User {
  id: number
  name: string
}

class SyncStringPromiseLike implements PromiseLike<string> {
  private promise: Promise<string>
  constructor(value: string) {
    this.promise = Promise.resolve<string>(value)
  }
  then<U = string, E = never>(onFulfilled: (value: string) => U | PromiseLike<U>, onRejected?: (error: Error) => E | PromiseLike<E>): PromiseLike<Awaited<U | E>> {
    return this.promise.then<U, E>(onFulfilled, onRejected)
  }
}

class ErrorStringPromiseLike implements PromiseLike<string> {
  private promise: Promise<string>
  constructor(error: Error) {
    this.promise = Promise.reject<string>(error)
  }
  then<U = string, E = never>(onFulfilled: (value: string) => U | PromiseLike<U>, onRejected?: (error: Error) => E | PromiseLike<E>): PromiseLike<Awaited<U | E>> {
    return this.promise.then<U, E>(onFulfilled, onRejected)
  }
}

function clearRaceTimers(timerIds: int[]): void {
  for (let i = 0; i < timerIds.length; i++) {
    clearTimeout(timerIds[i])
  }
}

export default function BuiltinsPromiseRaceSecondTest(): void {
  describe('BuiltinsPromiseRaceSecondTest', (): void => {
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
      // Required by XTS describe completeness; no per-case cleanup for this suite.
    })
    afterAll((): void => {
      // Required by XTS describe completeness; no suite-level cleanup for this suite.
    })

    /**
     * @tc.name   PromiseRaceSecondTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_0100
     * @tc.desc   Verify Promise.race with Set of resolved Promises
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRaceSecondTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      promises.add(new Promise<string>((resolve) => resolve("one")))
      promises.add(new Promise<string>((resolve) => resolve("two")))
      let result = await Promise.race<string>(promises)
      expect(result).assertEqual("one")
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_0200
     * @tc.desc   Verify Promise.race with Set of primitive numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRaceSecondTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let values = new Set<number>([1, 2, 3])
      let result = await Promise.race<number>(values)
      expect(result).assertEqual(1)
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_0300
     * @tc.desc   Verify Promise.race with Set of PromiseLike values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceSecondTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<PromiseLike<string>>()
      promises.add(Promise.resolve("first"))
      promises.add(Promise.resolve("second"))
      let result = await Promise.race<string>(promises)
      expect(result).assertEqual("first")
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_0400
     * @tc.desc   Verify Promise.race with Set of mixed primitive and PromiseLike
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceSecondTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let mixed = new Set<number>()
      mixed.add(100)
      mixed.add(200)
      let result = await Promise.race<number>(mixed)
      expect(result).assertEqual(100)
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_0500
     * @tc.desc   Verify Promise.race with Set containing null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceSecondTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let iterable = new Set<string | null>()
      iterable.add(null)
      iterable.add("value")
      let result = await Promise.race<string | null>(iterable)
      expect(result).assertEqual(null)
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_0600
     * @tc.desc   Verify Promise.race with Set containing undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceSecondTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let iterable = new Set<number | undefined>()
      iterable.add(undefined)
      iterable.add(42)
      let result = await Promise.race<number | undefined>(iterable)
      expect(result).assertEqual(undefined)
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_0700
     * @tc.desc   Verify Promise.race with empty Set never resolves
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceSecondTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let emptySet = new Set<Promise<string>>()
      let timerIds: int[] = []
      let sentinel = "still pending"
      try {
        let result = await Promise.race<string>([
          Promise.race<string>(emptySet),
          new Promise<string>((resolve) => {
            timerIds.push(setTimeout(() => resolve(sentinel), 100))
          })
        ])
        expect(result).assertEqual(sentinel)
      } finally {
        clearRaceTimers(timerIds)
      }
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_0800
     * @tc.desc   Verify Promise.race with Set of resolved string Promises returns the first value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRaceSecondTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let stringSet = new Set<Promise<string>>()
      stringSet.add(new Promise<string>((resolve) => resolve("hello")))
      stringSet.add(new Promise<string>((resolve) => resolve("world")))
      let result = await Promise.race<string>(stringSet)
      expect(result).assertEqual("hello")
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_0900
     * @tc.desc   Verify Promise.race with Set of resolved number Promises returns the first value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRaceSecondTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let numberSet = new Set<Promise<number>>()
      numberSet.add(new Promise<number>((resolve) => resolve(42)))
      let result = await Promise.race<number>(numberSet)
      expect(result).assertEqual(42)
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_1000
     * @tc.desc   Verify Promise.race with Set of resolved boolean Promises returns the first value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRaceSecondTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let boolSet = new Set<Promise<boolean>>()
      boolSet.add(new Promise<boolean>((resolve) => resolve(true)))
      let result = await Promise.race<boolean>(boolSet)
      expect(result).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_1100
     * @tc.desc   Verify Promise.race with Set of User object Promises
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceSecondTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let userSet = new Set<Promise<User>>()
      userSet.add(new Promise<User>((resolve) => resolve({ id: 1, name: "Alice" })))
      userSet.add(new Promise<User>((resolve) => resolve({ id: 2, name: "Bob" })))
      let result = await Promise.race<User>(userSet)
      expect(result.id).assertEqual(1)
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_1200
     * @tc.desc   Verify Promise.race with Set of array Promises
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceSecondTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let arraySet = new Set<Promise<number[]>>()
      arraySet.add(new Promise<number[]>((resolve) => resolve([1, 2, 3])))
      arraySet.add(new Promise<number[]>((resolve) => resolve([4, 5, 6])))
      let result = await Promise.race<number[]>(arraySet)
      expect(result.length).assertEqual(3)
      expect(result[0]).assertEqual(1)
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_1300
     * @tc.desc   Verify Promise.race with Set of union type Promises
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceSecondTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let unionSet = new Set<Promise<string | number>>()
      unionSet.add(new Promise<string | number>((resolve) => resolve("text")))
      unionSet.add(new Promise<string | number>((resolve) => resolve(123)))
      let result = await Promise.race<string | number>(unionSet)
      expect(result).assertEqual("text")
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest1400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_1400
     * @tc.desc   Verify Promise.race with Set of delayed Promises returns fastest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceSecondTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let timerIds: int[] = []
      let delayedSet = new Set<Promise<string>>()
      delayedSet.add(new Promise<string>((resolve) => {
        timerIds.push(setTimeout(() => resolve("slow"), 200))
      }))
      delayedSet.add(new Promise<string>((resolve) => {
        timerIds.push(setTimeout(() => resolve("fast"), 100))
      }))
      try {
        let result = await Promise.race<string>(delayedSet)
        expect(result).assertEqual("fast")
      } finally {
        clearRaceTimers(timerIds)
      }
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest1500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_1500
     * @tc.desc   Verify Promise.race with Set of delayed Promises resolves to fastest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRaceSecondTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let timerIds: int[] = []
      let promises = new Set<Promise<string>>()
      promises.add(new Promise<string>((resolve) => {
        timerIds.push(setTimeout(() => resolve("one"), 200))
      }))
      promises.add(new Promise<string>((resolve) => {
        timerIds.push(setTimeout(() => resolve("two"), 100))
      }))
      try {
        let result = await Promise.race<string>(promises)
        expect(result).assertEqual("two")
      } finally {
        clearRaceTimers(timerIds)
      }
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest1600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_1600
     * @tc.desc   Verify Promise.race with Set rejects when fastest Promise rejects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRaceSecondTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let timerIds: int[] = []
      let expectedError = new Error("failed first")
      let promises = new Set<Promise<string>>()
      promises.add(new Promise<string>((_, reject) => {
        timerIds.push(setTimeout(() => reject(expectedError), 100))
      }))
      promises.add(new Promise<string>((resolve) => {
        timerIds.push(setTimeout(() => resolve("success"), 200))
      }))
      let caught: boolean = false
      try {
        await Promise.race<string>(promises)
      } catch (error) {
        caught = true
        expect(error).assertEqual(expectedError)
      } finally {
        clearRaceTimers(timerIds)
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest1700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_1700
     * @tc.desc   Verify Promise.race with Set resolves when fastest Promise resolves
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRaceSecondTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let timerIds: int[] = []
      let promises = new Set<Promise<number>>()
      promises.add(new Promise<number>((resolve) => {
        timerIds.push(setTimeout(() => resolve(100.0), 100))
      }))
      promises.add(new Promise<number>((_, reject) => {
        timerIds.push(setTimeout(() => reject(new Error("error")), 200))
      }))
      promises.add(new Promise<number>((resolve) => {
        timerIds.push(setTimeout(() => resolve(300.0), 300))
      }))
      try {
        let result = await Promise.race<number>(promises)
        expect(result).assertEqual(100.0)
      } finally {
        clearRaceTimers(timerIds)
      }
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest1800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_1800
     * @tc.desc   Verify Promise.race with single Promise in Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRaceSecondTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let singleSet = new Set<Promise<string>>()
      singleSet.add(new Promise<string>((resolve) => resolve("only one")))
      let result = await Promise.race<string>(singleSet)
      expect(result).assertEqual("only one")
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest1900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_1900
     * @tc.desc   Verify Promise.race with single primitive value in Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRaceSecondTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let singleValue = new Set<number>([42])
      let result = await Promise.race<number>(singleValue)
      expect(result).assertEqual(42)
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest2000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_2000
     * @tc.desc   Verify Promise.race with Set containing null value Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRaceSecondTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string | null>>()
      promises.add(new Promise<string | null>((resolve) => resolve(null)))
      promises.add(new Promise<string | null>((resolve) => resolve("value")))
      let result = await Promise.race<string | null>(promises)
      expect(result).assertEqual(null)
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest2100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_2100
     * @tc.desc   Verify Promise.race with Set containing undefined value Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRaceSecondTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<number | undefined>>()
      promises.add(new Promise<number | undefined>((resolve) => resolve(undefined)))
      promises.add(new Promise<number | undefined>((resolve) => resolve(123)))
      let result = await Promise.race<number | undefined>(promises)
      expect(result).assertEqual(undefined)
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest2200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_2200
     * @tc.desc   Verify Promise.race with Set containing zero value Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRaceSecondTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<number>>()
      promises.add(new Promise<number>((resolve) => resolve(0)))
      promises.add(new Promise<number>((resolve) => resolve(1)))
      let zeroResult = await Promise.race<number>(promises)
      expect(zeroResult).assertEqual(0)
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest2300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_2300
     * @tc.desc   Verify Promise.race with Set containing false value Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRaceSecondTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let timerIds: int[] = []
      let promises = new Set<Promise<boolean>>()
      promises.add(new Promise<boolean>((resolve) => resolve(false)))
      promises.add(new Promise<boolean>((resolve) => {
        timerIds.push(setTimeout(() => resolve(true), 100))
      }))
      try {
        let falseResult = await Promise.race<boolean>(promises)
        expect(falseResult).assertFalse()
      } finally {
        clearRaceTimers(timerIds)
      }
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest2400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_2400
     * @tc.desc   Verify Promise.race with Set returns the resolved value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRaceSecondTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      promises.add(Promise.resolve("test"))
      let racePromise = Promise.race<string>(promises)
      let result = await racePromise
      expect(result).assertEqual("test")
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest2500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_2500
     * @tc.desc   Verify Promise.race with Set and explicit string type annotation returns its value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceSecondTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      promises.add(new Promise<string>((resolve) => resolve("hello")))
      let result: string = await Promise.race<string>(promises)
      expect(result).assertEqual("hello")
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest2600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_2600
     * @tc.desc   Verify Promise.race with Set of numbers and explicit type annotation returns first value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceSecondTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let numberSet = new Set<number>([42, 100])
      let numberResult: number = await Promise.race<number>(numberSet)
      expect(numberResult).assertEqual(42)
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest2700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_2700
     * @tc.desc   Verify Promise.race with Set containing Number.MAX_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceSecondTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<number>>()
      promises.add(new Promise<number>((resolve) => resolve(Number.MAX_VALUE)))
      promises.add(new Promise<number>((resolve) => resolve(100)))
      let result = await Promise.race<number>(promises)
      expect(result).assertEqual(Number.MAX_VALUE)
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest2800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_2800
     * @tc.desc   Verify Promise.race with Set containing Number.MIN_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceSecondTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<number>>()
      promises.add(new Promise<number>((resolve) => resolve(Number.MIN_VALUE)))
      promises.add(new Promise<number>((resolve) => resolve(0)))
      let result = await Promise.race<number>(promises)
      expect(result).assertEqual(Number.MIN_VALUE)
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest2900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_2900
     * @tc.desc   Verify Promise.race with Set containing long string value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceSecondTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let longString = "a".repeat(10000)
      let promises = new Set<Promise<string>>()
      promises.add(new Promise<string>((resolve) => resolve(longString)))
      promises.add(new Promise<string>((resolve) => resolve("short")))
      let result = await Promise.race<string>(promises)
      expect(result).assertEqual(longString)
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest3000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_3000
     * @tc.desc   Verify Promise.race with Set containing NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceSecondTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<number>>()
      promises.add(new Promise<number>((resolve) => resolve(NaN)))
      promises.add(new Promise<number>((resolve) => resolve(42)))
      let result = await Promise.race<number>(promises)
      expect(Number.isNaN(result)).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest3100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_3100
     * @tc.desc   Verify Promise.race with Set containing Infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceSecondTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<number>>()
      promises.add(new Promise<number>((resolve) => resolve(Infinity)))
      promises.add(new Promise<number>((resolve) => resolve(100)))
      let result = await Promise.race<number>(promises)
      expect(result).assertEqual(Infinity)
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest3200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_3200
     * @tc.desc   Verify Promise.race with Set rejects with CustomError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRaceSecondTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let expectedError = new CustomError("custom error")
      let promises = new Set<Promise<string>>()
      promises.add(new Promise<string>((resolve: (value: string | PromiseLike<string>) => void, reject: (reason: Error) => void) => {
        reject(expectedError)
      }))
      promises.add(new Promise<string>((resolve: (value: string | PromiseLike<string>) => void) => resolve("success")))
      let caught: boolean = false
      try {
        await Promise.race<string>(promises)
      } catch (error) {
        caught = true
        expect(error).assertEqual(expectedError)
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest3300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_3300
     * @tc.desc   Verify Promise.race with Set rejects with Error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRaceSecondTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let expectedError = new Error("test error")
      let promises = new Set<Promise<string>>()
      promises.add(new Promise<string>((_, reject) => {
        reject(expectedError)
      }))
      let caught: boolean = false
      try {
        await Promise.race<string>(promises)
      } catch (error) {
        caught = true
        expect(error).assertEqual(expectedError)
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest3400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_3400
     * @tc.desc   Verify Promise.race accepts an array values iterator and returns its first value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceSecondTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let values: string[] = ["iterator-first", "iterator-second"]
      let result = await Promise.race<string>(values.values())
      expect(result).assertEqual("iterator-first")
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest3500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_3500
     * @tc.desc   Verify Promise.race accepts a string iterable and returns its first character
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceSecondTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let result = await Promise.race<string>("race")
      expect(result).assertEqual("r")
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest3600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_3600
     * @tc.desc   Verify Promise.race with array rejects when first Promise rejects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRaceSecondTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let expectedError = new Error("error")
      let caught: boolean = false
      try {
        await Promise.race<string>([
          Promise.reject(expectedError),
          Promise.resolve("success")
        ])
      } catch (error) {
        caught = true
        expect(error).assertEqual(expectedError)
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest3700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_3700
     * @tc.desc   Verify Promise.race with reject executes finally block
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRaceSecondTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let finallyExecuted = false
      let expectedError = new Error("error")
      let caught: boolean = false
      try {
        await Promise.race<string>([
          Promise.reject(expectedError),
          Promise.resolve("success")
        ])
      } catch (error) {
        caught = true
        expect(error).assertEqual(expectedError)
      } finally {
        finallyExecuted = true
      }
      expect(caught).assertTrue()
      expect(finallyExecuted).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest3800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_3800
     * @tc.desc   Verify Promise.race with then chain transforms value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRaceSecondTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let result = await Promise.race<number>([Promise.resolve(1.0), Promise.resolve(2.0)])
        .then(value => {
          expect(value).assertEqual(1)
          return value * 2
        })
        .then(value => {
          expect(value).assertEqual(2)
          return value + 10
        })
      expect(result).assertEqual(12)
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest3900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_3900
     * @tc.desc   Verify Promise.race with then returning Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRaceSecondTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let result = await Promise.race<string>([Promise.resolve("hello")])
        .then(value => {
          expect(value).assertEqual("hello")
          return Promise.resolve(value.toUpperCase())
        })
      expect(result).assertEqual("HELLO")
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest4000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_4000
     * @tc.desc   Verify Promise.race with catch recovers from rejection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRaceSecondTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let expectedError = new Error("race error")
      let result = await Promise.race<string>([
        Promise.reject(expectedError)
      ]).catch((error) => {
        expect(error).assertEqual(expectedError)
        return "recovered"
      })
      expect(result).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest4100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_4100
     * @tc.desc   Verify Promise.race with finally executes callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRaceSecondTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let finallyCalled = false
      let result = await Promise.race<string>([Promise.resolve("value")])
        .finally(() => { finallyCalled = true })
      expect(result).assertEqual("value")
      expect(finallyCalled).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest4200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_4200
     * @tc.desc   Verify Promise.race with then-catch-finally chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRaceSecondTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let result = await Promise.race<string>([Promise.resolve("value")])
        .then(v => {
          expect(v).assertEqual("value")
          return v.toUpperCase()
        })
        .catch(() => "error")
        .finally(() => {})
      expect(result).assertEqual("VALUE")
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest4300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_4300
     * @tc.desc   Verify Promise.race timeout pattern rejects on timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceSecondTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let timerIds: int[] = []
      let expectedError = new Error("Timeout after 500ms")
      let caught: boolean = false
      try {
        await Promise.race<string>([
          new Promise<string>((resolve) => {
            timerIds.push(setTimeout(() => resolve("slow"), 2000))
          }),
          new Promise<string>((_, reject) => {
            timerIds.push(setTimeout(() => reject(expectedError), 500))
          })
        ])
      } catch (error) {
        caught = true
        expect(error).assertEqual(expectedError)
      } finally {
        clearRaceTimers(timerIds)
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest4400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_4400
     * @tc.desc   Verify Promise.race timeout pattern resolves before timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceSecondTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let timerIds: int[] = []
      try {
        let result = await Promise.race([
          new Promise<string>((resolve) => {
            timerIds.push(setTimeout(() => resolve("fast"), 100))
          }),
          new Promise<string>((_, reject) => {
            timerIds.push(setTimeout(() => reject(new Error("Timeout")), 500))
          })
        ])
        expect(result).assertEqual("fast")
      } finally {
        clearRaceTimers(timerIds)
      }
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest4500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_4500
     * @tc.desc   Verify Promise.race fallback pattern returns fallback on slow Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceSecondTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let timerIds: int[] = []
      try {
        let result = await Promise.race([
          new Promise<string>((resolve) => {
            timerIds.push(setTimeout(() => resolve("slow"), 2000))
          }),
          new Promise<string>((resolve) => {
            timerIds.push(setTimeout(() => resolve("fallback value"), 500))
          })
        ])
        expect(result).assertEqual("fallback value")
      } finally {
        clearRaceTimers(timerIds)
      }
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest4600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_4600
     * @tc.desc   Verify Promise.race fallback pattern returns fast result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceSecondTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let timerIds: int[] = []
      try {
        let result2 = await Promise.race([
          new Promise<string>((resolve) => {
            timerIds.push(setTimeout(() => resolve("fast"), 100))
          }),
          new Promise<string>((resolve) => {
            timerIds.push(setTimeout(() => resolve("fallback value"), 500))
          })
        ])
        expect(result2).assertEqual("fast")
      } finally {
        clearRaceTimers(timerIds)
      }
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest4700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_4700
     * @tc.desc   Verify Promise.race with Set resolves immediately with sync Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRaceSecondTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let timerIds: int[] = []
      let promises = new Set<Promise<string>>()
      promises.add(Promise.resolve("fast"))
      promises.add(new Promise<string>((resolve) => {
        timerIds.push(setTimeout(() => resolve("slow"), 100))
      }))
      try {
        let result = await Promise.race<string>(promises)
        expect(result).assertEqual("fast")
      } finally {
        clearRaceTimers(timerIds)
      }
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest4800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_4800
     * @tc.desc   Verify Promise.race combined with Promise.all for sequential tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceSecondTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results: string[] = []
      let promises = [
        new Promise<void>(resolve => { setTimeout(() => { results.push("task1"); resolve(undefined) }, 100) }),
        new Promise<void>(resolve => { setTimeout(() => { results.push("task2"); resolve(undefined) }, 150) }),
        new Promise<void>(resolve => { setTimeout(() => { results.push("task3"); resolve(undefined) }, 200) })
      ]
      await Promise.all(promises)
      expect(results.length).assertEqual(3)
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest4900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_4900
     * @tc.desc   Verify Promise.race with forever pending Promise resolves with other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRaceSecondTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let foreverPending = new Promise<string>(() => {})
      let result = await Promise.race<string>([
        foreverPending,
        Promise.resolve("completed")
      ])
      expect(result).assertEqual("completed")
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest5000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_5000
     * @tc.desc   Verify Promise.race with all pending Promises and timeout rejects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceSecondTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let allPending = [
        new Promise<string>(() => {}),
        new Promise<string>(() => {})
      ]
      let timerIds: int[] = []
      let expectedError = new Error("timeout")
      let timeoutPromise = new Promise<string>((_, reject) => {
        timerIds.push(setTimeout(() => reject(expectedError), 500))
      })
      let caught: boolean = false
      try {
        await Promise.race<string>([allPending[0], allPending[1], timeoutPromise])
      } catch (error) {
        caught = true
        expect(error).assertEqual(expectedError)
      } finally {
        clearRaceTimers(timerIds)
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest5100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_5100
     * @tc.desc   Verify Promise.race with sync thenable in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceSecondTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let syncThenable = new SyncStringPromiseLike("sync thenable")
      let result1 = await Promise.race<string>([syncThenable])
      expect(result1).assertEqual("sync thenable")
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest5200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_5200
     * @tc.desc   Verify Promise.race with error thenable rejects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceSecondTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let expectedError = new Error("thenable error")
      let errorThenable = new ErrorStringPromiseLike(expectedError)
      let caught: boolean = false
      try {
        await Promise.race<string>([errorThenable])
      } catch (error) {
        caught = true
        expect(error).assertEqual(expectedError)
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest5300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_5300
     * @tc.desc   Verify Promise.race with void type Promises
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceSecondTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let result1 = await Promise.race<void>([
        Promise.resolve(),
        Promise.resolve()
      ])
      expect(result1).assertEqual(undefined)
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest5400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_5400
     * @tc.desc   Verify Promise.race with union type Promises
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceSecondTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let result1 = await Promise.race<string>([
        Promise.resolve("string value")
      ])
      expect(result1).assertEqual("string value")
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest5500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_5500
     * @tc.desc   Verify Promise.race with nested resolved Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceSecondTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let nestedPromise = Promise.resolve(
        Promise.resolve("deeply nested")
      )
      let result = await Promise.race<string>([nestedPromise])
      expect(result).assertEqual("deeply nested")
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest5600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_5600
     * @tc.desc   Verify Promise.race in loop with 1000 iterations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceSecondTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let count = 0
      for (let i = 0; i < 1000; i++) {
        let promise = Promise.race<number>([
          Promise.resolve<number>(i),
          Promise.resolve<number>(i + 1)
        ])
        let result = await promise
        expect(result).assertEqual(i)
        count++
      }
      expect(count).assertEqual(1000)
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest5700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_5700
     * @tc.desc   Verify Promise.race with fallback on all rejections
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceSecondTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let expectedError = new Error("error1")
      let caught: boolean = false
      try {
        await Promise.race<string>([
          Promise.reject(expectedError),
          Promise.reject(new Error("error2"))
        ])
      } catch (error) {
        caught = true
        expect(error).assertEqual(expectedError)
      }
      expect(caught).assertTrue()
      let expectedFallbackError = new Error("error3")
      let result = await Promise.race<string>([
        Promise.reject(expectedFallbackError),
        Promise.resolve("fallback value")
      ]).catch((error) => {
        expect(error).assertEqual(expectedFallbackError)
        return "fallback value"
      })
      expect(result).assertEqual("fallback value")
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest5800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_5800
     * @tc.desc   Verify Promise.race rejects when the first already-settled entry is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceSecondTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let expectedError = new Error("error")
      let caught: boolean = false
      try {
        await Promise.race<string>([
          Promise.reject(expectedError),
          Promise.resolve("success")
        ])
      } catch (error) {
        caught = true
        expect(error).assertEqual(expectedError)
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest5900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_5900
     * @tc.desc   Verify Promise.race with delayed Promises returns fastest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRaceSecondTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let timerIds: int[] = []
      try {
        let result = await Promise.race<string>([
          new Promise<string>((resolve) => {
            timerIds.push(setTimeout(() => resolve("fast"), 100))
          }),
          new Promise<string>((resolve) => {
            timerIds.push(setTimeout(() => resolve("slow"), 200))
          })
        ])
        expect(result).assertEqual("fast")
      } finally {
        clearRaceTimers(timerIds)
      }
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest6000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_6000
     * @tc.desc   Verify Promise.race with multiple resolved Promises returns first
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRaceSecondTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result = await Promise.race<string>([
        Promise.resolve("a"),
        Promise.resolve("b"),
        Promise.resolve("c")
      ])
      expect(result).assertEqual("a")
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest6100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_6100
     * @tc.desc   Verify Promise.race with Promise.all for batched race operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceSecondTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let timerIds: int[] = []
      let racePromises: Promise<number>[] = []
      for (let i = 0; i < 5; i++) {
        let innerPromises = new Set<Promise<number>>()
        innerPromises.add(new Promise<number>((resolve) => {
          timerIds.push(setTimeout(() => resolve(i * 10.0), 100))
        }))
        innerPromises.add(new Promise<number>((resolve) => {
          timerIds.push(setTimeout(() => resolve(i * 20.0), 200))
        }))
        racePromises.push(Promise.race<number>(innerPromises))
      }
      try {
        let results = await Promise.all(racePromises)
        expect(results.length).assertEqual(5)
        for (let i = 0; i < results.length; i++) {
          expect(results[i]).assertEqual(i * 10.0)
        }
      } finally {
        clearRaceTimers(timerIds)
      }
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest6200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_6200
     * @tc.desc   Verify Promise.race inside then callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceSecondTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let timerIds: int[] = []
      let result = await Promise.resolve("outer")
        .then<string>((outer) => {
          expect(outer).assertEqual("outer")
          let promises = new Set<Promise<string>>()
          promises.add(Promise.resolve("inner-fast"))
          promises.add(new Promise<string>((resolve) => {
            timerIds.push(setTimeout(() => resolve("inner-slow"), 100))
          }))
          return Promise.race<string>(promises)
        })
      try {
        expect(result).assertEqual("inner-fast")
      } finally {
        clearRaceTimers(timerIds)
      }
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest6300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_6300
     * @tc.desc   Verify Promise.race with Set of 3 then-mapped Promises
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceSecondTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<number>>()
      for (let i = 0; i < 3; i++) {
        promises.add(Promise.resolve<number>(i))
      }
      let result = await Promise.race<number>(promises)
      expect(result).assertEqual(0)
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest6400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_6400
     * @tc.desc   Verify Promise.race with Set of 5 then-mapped Promises
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceSecondTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<number>>()
      for (let i = 0; i < 5; i++) {
        promises.add(Promise.resolve<number>(i))
      }
      let result = await Promise.race<number>(promises)
      expect(result).assertEqual(0)
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest6500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_6500
     * @tc.desc   Verify Promise.race with Set of 10 then-mapped Promises
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceSecondTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<number>>()
      for (let i = 0; i < 10; i++) {
        promises.add(Promise.resolve<number>(i))
      }
      let result = await Promise.race<number>(promises)
      expect(result).assertEqual(0)
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest6600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_6600
     * @tc.desc   Verify Promise.race with 3 delayed Promises returns fastest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceSecondTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let timerIds: int[] = []
      let promises = new Set<Promise<string>>()
      promises.add(new Promise<string>((resolve) => {
        timerIds.push(setTimeout(() => resolve("slow"), 200))
      }))
      promises.add(new Promise<string>((resolve) => {
        timerIds.push(setTimeout(() => resolve("fast"), 100))
      }))
      promises.add(new Promise<string>((resolve) => {
        timerIds.push(setTimeout(() => resolve("slowest"), 300))
      }))
      try {
        let result = await Promise.race<string>(promises)
        expect(result).assertEqual("fast")
      } finally {
        clearRaceTimers(timerIds)
      }
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest6700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_6700
     * @tc.desc   Verify Promise.race with Set of null/undefined/string union type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceSecondTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string | null | undefined>>()
      promises.add(Promise.resolve<string | null | undefined>(null))
      promises.add(Promise.resolve<string | null | undefined>("value"))
      promises.add(Promise.resolve<string | null | undefined>(undefined))
      let result = await Promise.race<string | null | undefined>(promises)
      expect(result).assertEqual(null)
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest6800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_6800
     * @tc.desc   Verify Promise.race with Set containing empty array Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceSecondTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<number[]>>()
      promises.add(new Promise<number[]>((resolve) => resolve([])))
      promises.add(new Promise<number[]>((resolve) => resolve([1, 2, 3])))
      let result = await Promise.race<number[]>(promises)
      expect(result.length).assertEqual(0)
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest6900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_6900
     * @tc.desc   Verify Promise.race with Set of string/number/boolean union type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceSecondTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string | number | boolean>>()
      promises.add(Promise.resolve("str"))
      promises.add(Promise.resolve(42.0))
      promises.add(Promise.resolve(true))
      let result = await Promise.race<string | number | boolean>(promises)
      expect(result).assertEqual("str")
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest7000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_7000
     * @tc.desc   Verify Promise.race with Set containing -Infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceSecondTest7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<number>>()
      promises.add(new Promise<number>((resolve) => resolve(-Infinity)))
      promises.add(new Promise<number>((resolve) => resolve(100)))
      let result = await Promise.race<number>(promises)
      expect(result).assertEqual(-Infinity)
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest7100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_7100
     * @tc.desc   Verify Promise.race with Set containing very long string value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceSecondTest7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      promises.add(new Promise<string>((resolve) => resolve("a".repeat(10000))))
      promises.add(new Promise<string>((resolve) => resolve("short")))
      let result = await Promise.race<string>(promises)
      expect(result).assertEqual("a".repeat(10000))
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest7200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_7200
     * @tc.desc   Verify Promise.race with already resolved Promise in Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRaceSecondTest7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      promises.add(new Promise<string>((resolve) => resolve("already resolved")))
      let result = await Promise.race<string>(promises)
      expect(result).assertEqual("already resolved")
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest7300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_7300
     * @tc.desc   Verify Promise.race with pending and resolved Promises
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRaceSecondTest7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let pendingPromise = new Promise<string>(() => {})
      let result = await Promise.race<string>([
        pendingPromise,
        Promise.resolve("settled")
      ])
      expect(result).assertEqual("settled")
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest7400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_7400
     * @tc.desc   Verify Promise.race with two delayed task Promises returns task1 first
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceSecondTest7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let timerIds: int[] = []
      let promises = [
        new Promise<string>((resolve) => {
          timerIds.push(setTimeout(() => resolve("task1"), 100))
        }),
        new Promise<string>((resolve) => {
          timerIds.push(setTimeout(() => resolve("task2"), 200))
        })
      ]
      try {
        let result = await Promise.race<string>(promises)
        expect(result).assertEqual("task1")
      } finally {
        clearRaceTimers(timerIds)
      }
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest7500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_7500
     * @tc.desc   Verify Promise.race with 3 resolved Promises in Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRaceSecondTest7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      promises.add(Promise.resolve("a"))
      promises.add(Promise.resolve("b"))
      promises.add(Promise.resolve("c"))
      let result = await Promise.race<string>(promises)
      expect(result).assertEqual("a")
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest7600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_7600
     * @tc.desc   Verify EAWorker.run callback nested Promise.race with array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRaceSecondTest7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let eaWorker = new EAWorker('raceWorker');
      eaWorker.start();
      try {
        let job = eaWorker.run<string>((a: string, b: string, c: string): string => {
          return a;
        }, "a", "b", "c");
        let workerResult = job.Await();
        let result = await Promise.race<string>([Promise.resolve(workerResult)]);
        expect(result).assertEqual("a");
      } finally {
        eaWorker.join().Await();
      }
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest7700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_7700
     * @tc.desc   Verify EAWorker.run callback nested Promise.race with array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRaceSecondTest7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let processedCount = new AtomicInt(0);
      let eaWorker = new EAWorker('msgWorker');
      eaWorker.start();
      try {
        let job = eaWorker.run<string>((a: string, b: string, c: string): string => {
          return a.toUpperCase();
        }, "a", "b", "c");
        let workerResult = job.Await();
        processedCount.fetchAdd(1);
        let result = await Promise.race<string>([Promise.resolve(workerResult)]);
        expect(result).assertEqual("A");
        expect(processedCount.load()).assertEqual(1);
      } finally {
        eaWorker.join().Await();
      }
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest7800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_7800
     * @tc.desc   Verify EAWorker.run callback nested Promise.race with timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRaceSecondTest7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let eaWorker = new EAWorker('raceWorker')
      eaWorker.start()
      let timerIds: int[] = []
      try {
        let job = eaWorker.run<string>(() => {
          return "worker-fast"
        })
        let workerResult = job.Await()
        let result = await Promise.race<string>([
          Promise.resolve(workerResult),
          new Promise<string>((resolve) => {
            timerIds.push(setTimeout(() => resolve("worker-slow"), 100))
          })
        ])
        expect(result).assertEqual("worker-fast")
      } finally {
        clearRaceTimers(timerIds)
        eaWorker.join().Await()
      }
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest7900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_7900
     * @tc.desc   Verify EAWorker.run callback nested Promise.race with timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRaceSecondTest7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let processedCount = new AtomicInt(0)
      let eaWorker = new EAWorker('msgRaceWorker')
      eaWorker.start()
      try {
        let job = eaWorker.run<string>((a: string, b: string, c: string): string => {
          return a
        }, "a", "b", "c")
        let workerResult = job.Await()
        processedCount.fetchAdd(1)
        let result = await Promise.race<string>([Promise.resolve(workerResult)])
        expect(result).assertEqual("a")
        expect(processedCount.load()).assertEqual(1)
      } finally {
        eaWorker.join().Await()
      }
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest8000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_8000
     * @tc.desc   Verify EAWorker.run callback nested Promise.race with Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRaceSecondTest8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let eaWorker = new EAWorker('raceWorker');
      eaWorker.start();
      try {
        let job = eaWorker.run<string>((a: string, b: string, c: string): string => {
          return a;
        }, "a", "b", "c");
        let workerResult = job.Await();
        let promiseSet = new Set<Promise<string>>();
        promiseSet.add(Promise.resolve(workerResult));
        let result = await Promise.race<string>(promiseSet);
        expect(result).assertEqual("a");
      } finally {
        eaWorker.join().Await();
      }
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest8100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_8100
     * @tc.desc   Verify EAWorker.run callback nested Promise.race with Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRaceSecondTest8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let processedCount = new AtomicInt(0);
      let eaWorker = new EAWorker('msgWorker');
      eaWorker.start();
      try {
        let job = eaWorker.run<string>((a: string, b: string, c: string): string => {
          return a.toUpperCase();
        }, "a", "b", "c");
        let workerResult = job.Await();
        processedCount.fetchAdd(1);
        let promiseSet = new Set<Promise<string>>();
        promiseSet.add(Promise.resolve(workerResult));
        let result = await Promise.race<string>(promiseSet);
        expect(result).assertEqual("A");
        expect(processedCount.load()).assertEqual(1);
      } finally {
        eaWorker.join().Await();
      }
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest8200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_8200
     * @tc.desc   Verify EAWorker.run callback nested Promise.race(Set) with timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRaceSecondTest8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let eaWorker = new EAWorker('raceSetWorker')
      eaWorker.start()
      let timerIds: int[] = []
      try {
        let job = eaWorker.run<string>(() => {
          return "worker-fast"
        })
        let workerResult = job.Await()
        let promiseSet = new Set<Promise<string>>();
        promiseSet.add(Promise.resolve(workerResult));
        promiseSet.add(new Promise<string>((resolve) => {
          timerIds.push(setTimeout(() => resolve("worker-slow"), 100))
        }));
        let result = await Promise.race<string>(promiseSet)
        expect(result).assertEqual("worker-fast")
      } finally {
        clearRaceTimers(timerIds)
        eaWorker.join().Await()
      }
      Done();
    })

    /**
     * @tc.name   PromiseRaceSecondTest8300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_SECOND_TEST_8300
     * @tc.desc   Verify EAWorker.run callback nested Promise.race(Set) with timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRaceSecondTest8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let processedCount = new AtomicInt(0)
      let eaWorker = new EAWorker('msgRaceSetWorker')
      eaWorker.start()
      try {
        let job = eaWorker.run<string>((a: string, b: string, c: string): string => {
          return a
        }, "a", "b", "c")
        let workerResult = job.Await()
        processedCount.fetchAdd(1)
        let promiseSet = new Set<Promise<string>>();
        promiseSet.add(Promise.resolve(workerResult));
        let result = await Promise.race<string>(promiseSet)
        expect(result).assertEqual("a")
        expect(processedCount.load()).assertEqual(1)
      } finally {
        eaWorker.join().Await()
      }
      Done();
    })

  })
}
